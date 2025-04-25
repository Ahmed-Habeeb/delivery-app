#  Delivery App

![Flutter](https://img.shields.io/badge/Flutter-3.29.2-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.7.2-blue.svg)

The **Delivery App** is a Flutter-based mobile application designed for delivery personnel to manage orders efficiently. It integrates with the  Delivery Service API to authenticate users and fetch delivery bills, with offline support through caching and session management for enhanced security.

## Table of Contents
- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)

## Features
- **User Authentication**: Secure login via the `CheckDeliveryLogin` API endpoint.
- **Order Management**: Fetch and display delivery bills using the `GetDeliveryBillsItems` API, with dynamic status indicators (New, Delivering, Delivered, Returned).
- **Offline Support**: Cache delivery bills using SQFlite for offline access.
- **Session Expiration**: Automatically logs out users after 2 minutes of inactivity (foreground or background) and redirects to the login screen.
- **Responsive UI**: Custom `OrderCard` widget with a clean, modern design (white background, rounded corners, shadow, dynamic status colors).
- **Feature-Based Clean Architecture**: Modular and scalable code structure with separation of concerns (data, domain, presentation).

## Architecture
The app follows a **Feature-Based Clean Architecture** to ensure modularity, testability, and maintainability. Each feature (e.g., `auth`, `order`) is organized into three layers:

- **Data Layer**: Handles API calls (`http`), local storage (`sqflite`), and data models.
- **Domain Layer**: Contains business logic (use cases), entities, and repository contracts.
- **Presentation Layer**: Manages UI and state using `Cubit` (from `flutter_bloc`).

### Key Design Patterns
- **Dependency Injection**: Uses `get_it` for managing dependencies.
- **State Management**: Implements `Cubit` for reactive state management.
- **Repository Pattern**: Abstracts data sources (remote and local) for seamless data handling.


## Installation

### Prerequisites
- **Flutter**: Version 3.10.0 or higher
- **Dart**: Version 3.0.0 or higher
- **IDE**: Android Studio, VS Code, or any IDE with Flutter support
- **Device/Emulator**: An Android/iOS device or emulator for testing

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Ahmed-Habeeb/delivery-app.git
   cd delivery-app
   

2. **Install Dependencies**:
   ```bash
    flutter pub get
    ```
3. **Run the App**:
 ```bash
   flutter run
   ```
4. **Build the App** (for release):
   ```bash
    flutter build apk --release
    ```
## Usage
1. **Login**: Enter your credentials and tap the login button.
2. **View Orders**: After logging in, you will see a list of delivery bills.
3. **Offline Access**: The app caches delivery bills for offline access. If you lose internet connectivity, you can still view previously fetched bills.

4. **Session Management**: The app will automatically log you out after 2 minutes of inactivity. You will be redirected to the login screen.


## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_svg: ^2.0.17
  google_fonts: ^6.2.1
  flutter_bloc: ^9.0.0
  get_it: ^8.0.3
  dio: ^5.8.0+1
  pretty_dio_logger: ^1.4.0
  phone_field:
    git:
      url: https://github.com/Ahmed-Habeeb/phone_field.git
  shared_preferences: ^2.5.2
  flutter_screenutil: ^5.9.3
  sqflite: ^2.4.2
```

