# Krishi Bindu App

This Flutter app, named Krishi Bindu, is designed to empower farmers by providing access to essential resources and knowledge on farming.

## Prerequisites:

Before running the app, you need to install the following software:

1. **Android Studio**: Android Studio is the official integrated development environment (IDE) for Android app development.
   - Download and install Android Studio from the official website: [Android Studio Download](https://developer.android.com/studio).

2. **Flutter SDK**: Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
   - Download the Flutter SDK from the official website: [Flutter SDK Download](https://flutter.dev/docs/get-started/install).
   - Follow the installation instructions based on your operating system.

3. **Dart SDK**: Dart is the programming language used for building Flutter apps.
   - Download the Dart SDK from the official website: [Dart SDK Download](https://dart.dev/get-dart/archive).
   - Follow the installation instructions based on your operating system.

## How to Run:

1. **Clone the Repository**: 
```
git clone https://github.com/Wittyhacks4CR004/WH036_Jacobs_Creek.git
```

2. **Navigate to the Project Directory**: 
```
cd Client
```

3. **Create .env file**:
Make a file named `.env` in the root directory. This file will contain the following things:
```
API_BASE_URL=http://SERVER_IP_ADDRESS:SERVER_PORT/api
```
.env.example
```
API_BASE_URL=http://192.168.137.1:8000/api
```
4. **Generate Splash Screen:**
- Run the following command to generate the splash screen for the app:
  ```
  flutter pub run flutter_native_splash:create --path=splash.yaml
  ```
  
5. **Install Dependencies**: 
```
flutter pub get
```

6. **Connect your Device**:
Connect your mobile device with the system or use the default Android emulator for using the app.

7. **Run the App**: 
```
flutter run
```
