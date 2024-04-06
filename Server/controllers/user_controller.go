// controllers/user_controller.go
package controllers

import (
	"context"
	"log"
	"net/http"

	"Server/db"
	"Server/models"
	"Server/utils" // Import the utils package

	"cloud.google.com/go/firestore"
	"firebase.google.com/go/auth"
	"github.com/gin-gonic/gin"
	"google.golang.org/api/iterator"
)

const usersCollection = "users"

var ctx = context.Background()

func SignupUser(c *gin.Context) {
	// Bind JSON request body to the user model
	var user models.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Hash the user's password
	hashedPassword, err := utils.HashPassword(user.PasswordHash)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to hash password"})
		return
	}

	// Set the hashed password in the user model
	user.PasswordHash = hashedPassword

	// Create user in Firebase Authentication
	params := (&auth.UserToCreate{}).
		Email(user.Email).
		Password(user.PasswordHash).
		DisplayName(user.Profile.FirstName + " " + user.Profile.LastName).
		Disabled(false)

	userRecord, err := db.AuthClient.CreateUser(ctx, params)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create user in Firebase Authentication"})
		return
	}

	// Set the AuthID field of the user model to the UID generated by Firebase Authentication
	user.AuthID = userRecord.UserInfo.UID

	// Create user in Firestore and let Firestore generate the ID
	docRef, _, err := db.FirestoreClient.Collection(usersCollection).Add(ctx, user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create user in Firestore"})
		return
	}

	// Set the ID field of the user model to the UID generated by Firestore
	user.ID = docRef.ID

	// Update the user document in Firestore with the user ID
	_, err = docRef.Set(ctx, user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update user ID in Firestore"})
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "User created successfully", "id": docRef.ID})
}

func LoginUser(c *gin.Context) {
	var credentials struct {
		Email    string `json:"email"`
		Password string `json:"password"`
	}

	if err := c.ShouldBindJSON(&credentials); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Retrieve user by email
	user, err := getUserByEmail(credentials.Email)
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid email"})
		return
	}

	// Compare hashed password using the function from the utils package
	if err := utils.ComparePasswords(user.PasswordHash, credentials.Password); err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Incorrect password"})
		return
	}

	// Authentication successful
	c.JSON(http.StatusOK, gin.H{"message": "Login successful", "user": user})
}

func GetUser(c *gin.Context) {
	userID := c.Param("id")

	doc, err := db.FirestoreClient.Collection(usersCollection).Doc(userID).Get(context.Background())
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
		return
	}

	var user models.User
	doc.DataTo(&user)

	c.JSON(http.StatusOK, user)
}

func GetUsers(c *gin.Context) {
	var users []models.User

	iter := db.FirestoreClient.Collection(usersCollection).Documents(context.Background())
	for {
		doc, err := iter.Next()
		if err == iterator.Done {
			break
		}
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve users"})
			return
		}

		var user models.User
		doc.DataTo(&user)
		users = append(users, user)
	}

	c.JSON(http.StatusOK, users)
}

func UpdateUser(c *gin.Context) {
	userID := c.Param("id")

	var updatedFields map[string]interface{}
	if err := c.ShouldBindJSON(&updatedFields); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Check if the user exists
	userRef := db.FirestoreClient.Collection(usersCollection).Doc(userID)
	docSnapshot, err := userRef.Get(context.Background())
	if err != nil {
		if err == iterator.Done {
			c.JSON(http.StatusNotFound, gin.H{"error": "User not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve user"})
		return
	}

	// Merge the existing user data with the updated fields
	var existingUser models.User
	docSnapshot.DataTo(&existingUser)
	for key, value := range updatedFields {
		switch key {
		case "firstName":
			existingUser.Profile.FirstName = value.(string)
		case "lastName":
			existingUser.Profile.LastName = value.(string)
		case "dob":
			existingUser.Profile.Dob = value.(string)
		case "profileImage":
			existingUser.Profile.ProfileImage = value.(string)
			// Add more cases for other fields you want to update
		}
	}

	// Update the user in Firestore
	_, err = userRef.Set(context.Background(), existingUser)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update user"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "User updated successfully"})
}

func DeleteUser(c *gin.Context) {
	userID := c.Param("id")

	// Retrieve the user document from Firestore to get the AuthID
	userDoc, err := db.FirestoreClient.Collection(usersCollection).Doc(userID).Get(context.Background())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve user from Firestore"})
		return
	}

	var user models.User
	if err := userDoc.DataTo(&user); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to parse user data from Firestore"})
		return
	}

	// Delete user from Authentication using AuthID
	err = db.AuthClient.DeleteUser(context.Background(), user.AuthID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete user from Authentication"})
		return
	}

	// Delete the user document from Firestore
	_, err = db.FirestoreClient.Collection(usersCollection).Doc(userID).Delete(context.Background())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete user from Firestore"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "User deleted successfully"})
}

func AddToFavouritesArticles(c *gin.Context) {
	userID := c.Param("id")
	articleID := c.Query("articleID")

	// Retrieve the user document
	userRef := db.FirestoreClient.Collection(usersCollection).Doc(userID)
	docSnapshot, err := userRef.Get(context.Background())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve user"})
		return
	}

	var user models.User
	if err := docSnapshot.DataTo(&user); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to parse user data"})
		return
	}

	// Add the article ID to favourites
	user.FavouriteArticles = append(user.FavouriteArticles, articleID)

	// Update the user document in Firestore
	_, err = userRef.Set(context.Background(), user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update user"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Article added to favourites successfully"})
}

func RemoveFromFavouritesArticles(c *gin.Context) {
	userID := c.Param("id")
	articleID := c.Query("articleID")

	// Retrieve the user document
	userRef := db.FirestoreClient.Collection(usersCollection).Doc(userID)
	docSnapshot, err := userRef.Get(context.Background())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve user"})
		return
	}

	var user models.User
	if err := docSnapshot.DataTo(&user); err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to parse user data"})
		return
	}

	// Check if the article is in favourites
	var isFavourite bool
	var updatedFavourites []string
	for _, favArticleID := range user.FavouriteArticles {
		if favArticleID == articleID {
			isFavourite = true
		} else {
			updatedFavourites = append(updatedFavourites, favArticleID)
		}
	}

	// If the article is not in favourites, return an error
	if !isFavourite {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Article is not in favourites"})
		return
	}

	// Update the user's favourites list without the removed article
	user.FavouriteArticles = updatedFavourites

	// Update the user document in Firestore
	_, err = userRef.Set(context.Background(), user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update user"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Article removed from favourites successfully"})
}

// AddToFavouriteBlogs adds a blog to the user's favourite blogs
func AddToFavouriteBlogs(c *gin.Context) {
	userID := c.Param("id")
	blogID := c.Query("blogID")

	// Update the user document in Firestore to add the blog to the favourites
	_, err := db.FirestoreClient.Collection("users").Doc(userID).Update(context.Background(), []firestore.Update{
		{Path: "FavouriteBlogs", Value: firestore.ArrayUnion(blogID)},
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add blog to favourites"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Blog added to favourites successfully"})
}

// RemoveFromFavouriteBlogs removes a blog from the user's favourite blogs
func RemoveFromFavouriteBlogs(c *gin.Context) {
	userID := c.Param("id")
	blogID := c.Query("blogID")

	// Update the user document in Firestore to remove the blog from the favourites
	_, err := db.FirestoreClient.Collection("users").Doc(userID).Update(context.Background(), []firestore.Update{
		{Path: "FavouriteBlogs", Value: firestore.ArrayRemove(blogID)},
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to remove blog from favourites"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Blog removed from favourites successfully"})
}

// AddToFavouriteVideos adds a video to the user's favourite videos
func AddToFavouriteVideos(c *gin.Context) {
	userID := c.Param("id")
	videoID := c.Query("videoID")

	// Update the user document in Firestore to add the video to the favourites
	_, err := db.FirestoreClient.Collection("users").Doc(userID).Update(context.Background(), []firestore.Update{
		{Path: "FavouriteVideos", Value: firestore.ArrayUnion(videoID)},
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to add video to favourites"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Video added to favourites successfully"})
}

// RemoveFromFavouriteVideos removes a video from the user's favourite videos
func RemoveFromFavouriteVideos(c *gin.Context) {
	userID := c.Param("id")
	videoID := c.Query("videoID")

	// Update the user document in Firestore to remove the video from the favourites
	_, err := db.FirestoreClient.Collection("users").Doc(userID).Update(context.Background(), []firestore.Update{
		{Path: "FavouriteVideos", Value: firestore.ArrayRemove(videoID)},
	})
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to remove video from favourites"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Video removed from favourites successfully"})
}

// Fetches all the blogs created by a particular user
func GetUserBlogs(c *gin.Context) {
	userID := c.Param("id")

	// Query Firestore to retrieve blogs created by the user
	iter := db.FirestoreClient.Collection("blogs").Where("AuthorID", "==", userID).Documents(context.Background())
	var blogs []models.Blog
	for {
		doc, err := iter.Next()
		if err == iterator.Done {
			break
		}
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to retrieve blogs"})
			return
		}

		var blog models.Blog
		if err := doc.DataTo(&blog); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to parse blog data"})
			return
		}

		blogs = append(blogs, blog)
	}
	log.Println(blogs)

	c.JSON(http.StatusOK, blogs)
}

func getUserByEmail(email string) (*models.User, error) {
	query := db.FirestoreClient.Collection(usersCollection).Where("Email", "==", email)
	iter := query.Documents(context.Background())

	doc, err := iter.Next()
	if err == iterator.Done {
		return nil, err
	}
	if err != nil {
		return nil, err
	}

	var user models.User
	doc.DataTo(&user)
	return &user, nil
}
