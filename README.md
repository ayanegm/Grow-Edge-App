# Grow Edge App 

**Grow Edge** is a production-level mobile platform built with **Flutter** and **Dart** using **Clean Architecture** principles. Designed to bridge the gap between coaches and students, the app provides tailored role-based flows: **coaches** can upload, structure, and manage training packages and courses, while **students** can seamlessly browse, select, and book their desired programs.

## Key Features & Highlights

* **Dual-Role User Workflows:** Distinct interfaces and authorization flows for **Students** (browsing & booking) and **Coaches** (course creation & package management).

* **Course & Package Management:** Dedicated tools for coaches to create, edit, and upload training programs and session packages.

* **Course Booking & Payments:** Integrated third-party payment infrastructure, including **Fawry**, allowing students to securely book courses directly within the app.

* **Backend Synchronization:** Real-time data sync with backend RESTful APIs for fast, asynchronous updates on available courses and bookings.

* **Local Data Persistence:** Utilized `SharedPreferences` for local caching, persistent user authentication states, and offline preference handling.

* **Production-Grade Architecture:** Structured using **Clean Architecture** to maintain high scalability, readability, and testability.

## Tech Stack & Tools

* **Framework:** [Flutter](https://flutter.dev/) (Dart)

* **Architecture:** Clean Architecture

* **State Management:** BLoC / Cubit / Provider

* **Networking:** RESTful APIs

* **Local Storage:** `SharedPreferences`

* **Third-Party Services:** Fawry Payment Gateway

## Project Architecture

The application is structured into distinct layers following Clean Architecture principles:

```
lib/
├── core/                # Utility classes, global themes, shared widgets, and API clients
├── features/            # Modular feature packages (Auth, Course Catalog, Booking, Payment, Profile)
│   ├── data/            # Data sources, models, and API/local service implementations
│   ├── domain/          # Business logic entities, use cases, and repository interfaces
│   └── presentation/    # UI screens, custom widgets, and state management logic
└── main.dart            # Application entry point & service initialization

```

## Getting Started

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version)

* [Dart SDK](https://dart.dev/get-dart)

* Android Studio / VS Code

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ayanegm/Grow-Edge-App.git
   cd Grow-Edge-App
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the application:**

   ```bash
   flutter run
   ```
