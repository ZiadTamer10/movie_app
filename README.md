# 🎬 Movie App

A Flutter Movie App that allows users to explore movies and TV shows, search for content, watch trailers, and get detailed information.

---

## 🚀 Features

* 🔍 Search for Movies & TV Shows
* 🎥 Watch Trailers (YouTube integration)
* ⭐ View Ratings & Details
* 🎬 Similar Movies & TV Shows
* 🔐 Authentication (Login & Register using Firebase)
* 📡 API Integration with TMDB
* ⚡ Smooth UI with Skeleton Loading

---

## 🛠️ Tech Stack

* Flutter
* Dart
* Bloc (Cubit)
* Firebase Authentication
* Dio (API calls)
* TMDB API
* YouTube Player

---

## 📸 Screenshots

### 🚀 Splash

![splash](assets/images/splash.png)

---

### 🔐 Authentication

| Login                              | Register                           |
| ---------------------------------- | ---------------------------------- |
| ![auth1](assets/images/Login.png) | ![auth2](assets/images/Register.png) |

---

### 🏠 Home

![home](assets/images/Home.png)

---

### 🎬 Details

![details](assets/images/Details.png)

---

### 🔍 Search

| Search 1                               | Search 2                               |
| -------------------------------------- | -------------------------------------- |
| ![search1](assets/images/Search2.png) | ![search2](assets/images/Search1.png) |

---

## 🧠 Architecture

This project follows **Clean Architecture** principles:

features/
├── data
│    ├── repos
│    ├── models
│
├── presentation
│    ├── views
│    ├── cubit

---

## 🔥 Key Highlights

* Dynamic API handling (Movies & TV)
* Error handling (Network + Firebase)
* Smart trailer selection (Official YouTube trailers)
* Reusable components
* State management using Bloc

---

## 📦 Installation

```bash
git clone https://github.com/ZiadTamer10/movie_app.git
cd movie_app
flutter pub get
flutter run
```

---

## ⚠️ Setup

Make sure to add your Firebase configuration files:

* Android → `google-services.json`
* iOS → `GoogleService-Info.plist`

Also, add your TMDB API key inside ApiServices.

---

## 💪 Author

**Ziad Tamer**

---

## ⭐ Don't forget to star the repo if you like it!
