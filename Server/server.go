package main

import (
	"log"
	"os"

	// "Server/db"
	// "Server/routes"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	// Initialize Firestore
	// if err := db.InitFirestore(); err != nil {
	// 	log.Fatalf("Error initializing Firestore: %v", err)
	// }

	// Load .env file
	err := godotenv.Load(".env")
	if err != nil {
		log.Fatalf("Error loading .env file")
	}

	// Set up Gin router
	router := gin.Default()

	// Apply CORS middleware
	config := cors.DefaultConfig()
	config.AllowOrigins = []string{"*"} // Allow requests from any origin
	router.Use(cors.New(config))

	// Set up routes

	// Run the server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8000"
	}
	router.Run(":" + port)
}

