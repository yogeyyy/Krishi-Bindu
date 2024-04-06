# NGO API

Welcome to the NGO API documentation. This API allows you to manage NGOs, including user registration, login, and NGO-related operations.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [API Endpoints](#api-endpoints)
  - [User](#user)
  - [NGO](#ngo)
  - [Chatbot](#chatbot)
  - [Videos](#videos)
  - [Donate](#donate)
  - [Events](#events)
  - [Campaigns](#campaigns)
  - [Blogs](#blogs)
  - [Articles](#articles)

## Introduction

This API provides functionality to manage NGOs and user registrations. It is built using Golang with the Gin framework and integrates with Firebase for authentication and Firestore for data storage.

## Features

- User creation, update, retrieval, deletion and login
- NGO creation, update, retrieval, deletion and login

## Getting Started

### Prerequisites

Before you begin, make sure you have the following installed:

- [Golang](https://golang.org/doc/install)
- [Firebase](https://firebase.google.com/docs/cli)
- [Gcloud](https://cloud.google.com/sdk/docs/install)

### Installation

1. **Clone the repository:**

```bash
   git clone https://github.com/yourusername/server-api.git
```

2. **Navigate to the project directory:**

```bash
   cd server-api
```

3. **Setup default credentials:**

```bash
   gcloud auth application-default login
```

4. **Install dependencies:**

```bash
   go mod download
```
5. **Make a .env file**:
   - Create a file named `.env` in the root directory of the project. This file will contain the API key required for Gemini integration.
   - Visit [Gemini](https://ai.google.dev/) to obtain an API key.
   - Store the API key in the `.env` file in the following format:
     ```
     API_KEY=your_api_key_here
     ```
   Replace `your_api_key_here` with the API key obtained from Gemini.

6. **Run the server:**

```bash
    go run server.go
```

### API Endpoints

###### Base URL:

```
http://localhost:8000/api
```

#### User

1. **Signup User:**

```
POST /users/signup/
Content-Type: application/json

{
    "email": "vbhatnagar@gmail.com",
    "password": "1shaj",
    "profile": {
        "firstName": "Vanshaj",
        "lastName": "Bhatnagar"
    }
}
```

```
Response example
{
    "id": "qid9wiB26SeV5wjx3XIp",
    "message": "User created successfully"
}
```

2. **Login User:**

```
POST /users/login/
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "secretpassword"
}
```

```
Response example
{
    "message": "Login successful",
    "user": {
        "id": "ofbmb53DAlb7EMQAswDfXTJ1eno1",
        "email": "admin@gmail.com",
        "password": "$2a$10$6J06PxI1tOVFuULQarN4..wA59NJLDhv0Mx4qfSh6gTu9OFZLpgwi",
        "profile": {
            "firstName": "Tanishq",
            "lastName": "Gupta",
            "dob": "",
            "profileImage": ""
        },
        "donations": null
    }
}
```

3. **Update User:**

```
PUT /users/:id/
Content-Type: application/json

{
    "firstName": "tanishq"
}
```

```
Response example
{
    "message": "User updated successfully"
}
```

4. **Delete User:**

```
DELETE /users/:id/
```

```
Response example
{
    "message": "User deleted successfully"
}
```

5. **Get All user:**

```
GET /users/
```

6. **Get Particular User:**

```
GET /users/:id/
```

7. **Get User's Favourite Blog:**

```
GET /users/:id/favourite-blog
```

#### NGO

1. **Signup NGO:**

```
POST /ngos/signup/
Content-Type: application/json

{
    "email": "ngo@gmail.com",
    "password": "ngo123",
    "profile": {
        "ngoName": "NGO 123"
    }
}
```

```
Response example
{
    "id": "QKVyBXUgYgaClRnaKjnZ",
    "message": "NGO created successfully"
}
```

2. **Login NGO:**

```
POST /ngos/login/
Content-Type: application/json

{
    "email": "ngo@gmail.com",
    "password": "ngo123"
}
```

```
Response example
{
    "message": "Login successful",
    "ngo": {
        "id": "7NYWU0wKM6OFBCrxtpAoBkIL4dl1",
        "email": "ngo@gmail.com",
        "password": "$2a$10$OJS7M2MRmgeKgFaQe5AxF.T8WvtQZ8PPxNLP7JaEn.mQU07kqIFry",
        "profile": {
            "registrationNumber": "",
            "ngoName": "NGO 123",
            "worksFor": "",
            "address": "",
            "pincode": "",
            "city": "",
            "state": "",
            "country": "",
            "phoneNumber": "",
            "description": "",
            "logo": ""
        },
        "campaigns": null
    }
}
```

3. **Update NGO:**

```
PUT /ngos/:id/
Content-Type: application/json

{
    "profile": {
        "registrationNumber": "reg1234",
        "ngoName": "NGO 123",
        "worksFor": "Females",
        "address": "address 123, address 456",
        "pincode": "123456",
        "city": "Some City",
        "state": "Some State",
        "country": "Some Country",
        "phoneNumber": "9876543210",
        "description": "This NGO works for the welfare of female farmers. Kindly support us with your contributions",
        "logo": "logo.png"
    }
}

```

4. **Delete NGO:**

```
DELETE /ngos/:id/
```

5. **Get All NGOs:**

```
GET /ngos/

```

6. **Get Particular NGO:**

```
GET /ngos/:id/
```

#### Chatbot

1. **Get Chatbot Response**

```
GET /chatbot
Content-type: application/json

{
    "contents": [
        {
            "role": "user",
            "parts": [
                {
                    "text": "What are you?"
                }
            ]
        }
    ]
}
```

```
Response example
{
    "text": "I am a large language model, trained by Google."
}
```

#### Videos

1. **Upload videos**

```
POST /videos/
Content-Type: application/json

{
    "id": "6",
    "title": "Yoga for Menstrual Health",
    "videoUrl": "https://youtu.be/wougJaN_Ha0?si=A1a705zZeYIeCYIp",
    "uploader": "Yoga Instructors",
    "uploadDate": "2024-02-26T13:00:00Z",
    "description": "Starting a nursery business involves meticulous planning, understanding market demand, and implementing effective strategies to ensure success. In this comprehensive guide, we'll delve into the intricacies of establishing and running a nursery business, covering everything from business planning to plant selection, farming techniques, and profitability analysis.Establishing a successful nursery business requires dedication, strategic planning, and a passion for plants. By following the steps outlined in this guide, you can create a thriving nursery operation that meets the needs of customers while achieving sustainable profitability. Stay innovative, adaptable, and customer-focused to stay ahead in the competitive nursery industry",
    "tags": ["Nursery"],
    "category": "Agriculture",
    "thumbnailUrl": "https://imgs.search.brave.com/UiDl7upJL02MN4J-xYqXIxlrq8wXlDRiC0FB6u4L-TI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jcm9w/Zm9ybGlmZS5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMjEv/MDEvQ29tbWVyY2lh/bC1BZ3JpY3VsdHVy/ZS5qcGc",
    "comments": [],
    "likes": 0,
    "transcripts": "This is a transcript of the agricultural video."
}
```

```
Response example
{
    "id": "OrnuOI0xFqCkonRXAMtZ",
    "message": "Video created successfully"
}
```

2. **Get Videos**

```
GET /videos/
```

3. **Get Particular Video**

```
GET /videos/:id/
```

4. **Update Video**

```
PUT /videos/:id/
Content-Type: application/json

{
    "title": "Introduction to Machine Learning",
    "uploader": "JohnDoe",
    "uploadDate": "2024-02-10T08:00:00Z",
    "description": "This video provides an overview of machine learning concepts.",
    "tags": [
        "machine learning",
        "artificial intelligence"
    ],
    "category": "Education",
    "thumbnailUrl": "https://example.com/thumbnail.jpg",
    "comments": [],
    "likes": 0,
    "transcripts": "Here are the transcripts of the video..."
}
```

```
Response Example
{
    "message": "Video updated successfully"
}
```

5. **Delete Video**

```
DELETE /videos/:id/
```

6. **Comment a Video**

```
POST /videos/:id/comments/
Content-Type: application/json
{
    "userID": "user1",
    "content": "This is the first comment"
}
```

```
Response Example
{
    "message": "Comment added successfully"
}
```

7. **Delete a Comment**

```
DELETE /videos/:video_id/comments?:comment_id/
```


#### Donate

1. **Donate to an NGO**

```
POST /transactions/donate/
Content-Type: application/json
{
    "senderID": "baE9bUIhfAKLSFEzDauO",
    "receiverID": "HnHCQyvhHRxdP0oHhdDa",
    "campaignID": "DZC5nZOkF5ggNXAIEriJ",
    "amount": 100
}
```

```
Response Example
{
    "message": "Transaction data stored successfully"
}
```

#### Events

1. **Create event**

```
POST /events/
Content-Type: application/json
{
    "title": "Pradhan Mantri Kisan Samman Nidhi (PM-KISAN)",
    "date": "2024-11-08",
    "day": "Saturday",
    "time": "9:00 AM",
    "location": "City Auditorium",
    "description": "Pradhan Mantri Kisan Samman Nidhi or PM-KISAN is one of the most famous government-funded schemes that aims to provide ample income support to small and marginal farmers in India. It was launched in 2019 and aims to provide necessary funds to Indian farmers so that they can take care of basic farming needs.",
    "banner": "https://imgs.search.brave.com/qT7D-7bds5cf33uk2cSk_5zo8HIRxLps_bro9zNYHFs/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wbWtp/c2Fuc3RhdHVzY2hl/Y2suY28vd3AtY29u/dGVudC91cGxvYWRz/LzIwMjQvMDEvUE0t/S2lzYW4tU2FtbWFu/LU5pZGhpLSVFMCVB/NCVBRiVFMCVBNSU4/QiVFMCVBNCU5QyVF/MCVBNCVBOCVFMCVB/NCVCRS0lRTAlQTQl/QjIlRTAlQTQlQkUl/RTAlQTQlQUQlRTAl/QTQlQkUlRTAlQTQl/QjAlRTAlQTUlOEQl/RTAlQTQlQTUlRTAl/QTUlODAtJUUwJUE0/JUI4JUUwJUE1JThE/JUUwJUE0JTlGJUUw/JUE1JTg3JUUwJUE0/JTlGJUUwJUE0JUI4/LSVFMCVBNCVCMiVF/MCVBNCVCRSVFMCVB/NCVBRCVFMCVBNCVC/RSVFMCVBNCVCMCVF/MCVBNSU4RCVFMCVB/NCVBNSVFMCVBNSU4/MC0lRTAlQTQlQjgl/RTAlQTUlODIlRTAl/QTQlOUElRTAlQTUl/ODAtZS1LWUMtJUUw/JUE0JUFBJUUwJUE1/JThEJUUwJUE0JUIw/JUUwJUE0JTk1JUUw/JUE1JThEJUUwJUE0/JUIwJUUwJUE0JUJG/JUUwJUE0JUFGJUUw/JUE0JUJFLSVFMCVB/NCU5NSVFMCVBNSU4/MC0lRTAlQTQlQUEl/RTAlQTUlODIlRTAl/QTQlQjAlRTAlQTUl/ODAtJUUwJUE0JTlD/JUUwJUE0JUJFJUUw/JUE0JUE4JUUwJUE0/JTk1JUUwJUE0JUJF/JUUwJUE0JUIwJUUw/JUE1JTgwLmpwZw",
    "organizerId": "vVUHa8ErJixf0ANNVSty",
    "participants": []
}
```

2. **Get All Events**

```
GET /events/
```

3. **Get Particular Event**

```
GET /events/:id/
```

4. **Update Event**

```
PUT /events/:id/
Content type: application/json
{
  "title": "Community Cleanup Drive",
  "date": "2024-02-16",
  "day": "Saturday",
  "time": "10:00 AM",
  "location": "Central Park",
  "description": "Join us for a community cleanup drive to help keep our city clean and green!",
  "banner": "https://example.com/cleanup_drive_banner.jpg"
}
```

5. **Register for event**

```
POST /events/:id/register?user=:id/
```

6. **Delete an event**

```
DELETE /events/:id/
```

#### Campaigns

1. **Create Campaign**

```
POST /campaigns/
Content type: application/json
{
    "ngoID": "F5Fzf8dG2ThhHx6P4p56",
    "title": "BackBack Govt to organise week-long nationwide campaign for farmers from tomorrow",
    "description": "Join our initiative to raise awareness about menstrual hygiene and break the stigma surrounding menstruation. We conduct educational workshops, distribute sanitary products, and promote open discussions about menstrual health.",
    "imageUrl": "https://images.livemint.com/img/2022/04/24/600x338/UKRAINE-CRISIS-FERTILIZER-1_1648533358705_1650813084017.JPG",
    "raisedMoney": 1500,
    "totalGoal": 5000,
    "donors": []
}
```

```
Response Example
{
    "id": "rfOYhSGYYCeoMBPawzDP",
    "message": "Campaign created successfully"
}
```

2. **Get all campaigns**

```
GET /campaigns/
```

3. **Get a particular campaign**

```
GET /campaigns/:id/
```

4. **Update a campaign**

```
PUT /initiatives/:id/
Content type: application/json
{
    "title": "Save Forests"
}1
```

5. **Update Image**

```
PATCH /campaigns/:id/update-image/
Content type: application/json
{
    "ImageURL": "https://www.example.com/image.jpeg"
}
```

6. **Add/remove donor**

```
PATCH /campaigns/:id/add-donor
PATCH /campaigns/:id/remove-donor
```


#### Blogs

1. **Create a blog**

```
Content type: application/json
{
    "id": "6",
    "title": "Cultivating Success: Maximizing Profits with Heirloom Tomatoes",
    "content": "n my recent assessment of the marketplace, I noticed a growing demand for heirloom tomatoes. Recognizing this trend, I decided to allocate a larger portion of my land to cultivating these prized tomatoes. As expected, the decision paid off handsomely, with the heirloom tomatoes fetching premium prices in the market. This experience reaffirmed the importance of staying attuned to market trends and strategically selecting crops with high value. By leveraging market insights and focusing on crops with strong demand, I've been able to maximize the profitability of my farm and ensure a steady income stream",
    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZYhZgEVSsfgbwtvmQde_Esbmkig1A1NYgXQ&s",
    "category": "Agriculture",
    "date": "2024-02-26T13:00:00Z"
}
```

```
Response Example
{
    "id": "YwmCEwZBahQv6X4ehxiO",
    "message": "Blog created successfully"
}
```


2. **Get Blogs**

```
GET /blogs/
```


#### Articles

1. **Create Article**

```
Content type: application/json
{
    "id": "7",
    "title": "Menstrual Health Advocacy: Bridging the Gap",
    "authorName": "Advocacy Group",
    "uploadDate": "2024-02-27T13:00:00Z",
    "content": "By 2050, the demand for food will surge 70%, in line with rapid population growth. A UN study found that about 9.9% of the world’s population still goes hungry, so the thought of feeding almost 10 billion mouths is a daunting prospect. With environmental changes hard to predict, we must turn to innovation in agriculture technology.Thankfully, the signs so far offer hope. We don’t have to wait three decades to see how innovative agricultural solutions can influence human life in the future.Read on to discover innovation and technology in agriculture to watch out for in 2023. We’ll explore technologies that change the way farmers grow, transport, store, and manage their produce.1. Bee Vectoring Technologies: When it comes to U.S. crop production, honey bees are worth $20 billion. These insects are essential to human survival, so there is increasing innovation in agriculture equipment to help protect bees and maximize their pollination capabilities.BVT uses commercially reared bees to deliver targeted crop controls through pollination, replacing chemical pesticides with an environmentally safe crop protection system.2. Precision Agriculture: The innovation in agriculture technology uses big data to aid management decisions, enabling farmers to control crop yield variables like moisture level, soil condition, and microclimates to maximize output. It relies on remote sensing systems, drones, robotics, and automation to improve crop health and optimize agricultural resources, leading to more productivity.3.  Indoor Vertical Farming 4. Livestock Farming Technology5.  Laser Scarecrows",
    "tags": ["Related Tags"],
    "category": "Future of Agriculture",
    "thumbnailUrl": "https://www.shutterstock.com/shutterstock/photos/2120616122/display_1500/stock-vector-women-s-day-banner-for-product-demonstration-pink-pedestal-or-podium-with-number-and-hearts-on-2120616122.jpg",
    "comments": [],
    "likes": 0
  }
```

```
Response Example
{
    "id": "GzON4geEUT0KwUKfbwwq",
    "message": "Article created successfully"
}
```

2. **Update an Article**

```
Content type: application/json

{
    "id": "article1",
    "title": "Sample Article",
    "authorName": "John Doe",
    "uploadDate": "2024-02-06T12:00:00Z",
    "content": "This is a sample article content.",
    "tags": [
        "tag1",
        "tag2",
        "tag3"
    ],
    "category": "Sample Category",
    "thumbnailURL": "https://example.com/thumbnail.jpg",
    "comments": [],
    "likes": 0
}
```

```
Response Example

{
    "message": "Article updated successfully"
}
```
