file tailored to your Flutter project for the Countries App. It provides an overview, setup instructions, features, and usage details based on the project structure and functionality we've developed.

markdown

Collapse

Wrap

Copy
# Countries App

A Flutter mobile application that displays a list of independent countries fetched from the REST Countries API. The app includes a home screen with a grid view of countries, search functionality, a detail screen for country information, and a favorites system with persistent storage.

## Features
- **Home Screen**: Displays a grid view of countries with flags, names, and populations. Includes loading and error states.
- **Search Functionality**: Filters the country list in real-time based on the country name.
- **Detail Screen**: Shows detailed information (name, population, area, region, subregion, and time zones) when a country is tapped.
- **Favorites System**: Allows users to mark countries as favorites with a heart icon, accessible via a separate favorites screen. Favorites persist across app restarts using SharedPreferences.
- **State Management**: Uses the Provider package for efficient state management.
- **Responsive Design**: Grid layout adapts to different screen sizes.

## Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed (version 3.x recommended).
- An IDE like Visual Studio Code or Android Studio with Flutter plugin.
- Android Emulator, iOS Simulator, or a physical device for testing.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/countries-app.git
   cd countries-app
Install dependencies:
bash

Collapse

Wrap

Run

Copy
flutter pub get
Run the app:
bash

Collapse

Wrap

Run

Copy
flutter run
Ensure an emulator or device is connected.
Usage
Home Screen: Browse the grid of countries. Use the search bar to filter by name. Tap a country to view details or use the heart icon to add/remove it from favorites.
Detail Screen: View comprehensive country details. Use the back arrow to return.
Favorites Screen: Access via the bottom navigation bar to see favorited countries.
Project Structure
text

Collapse

Wrap

Copy
countries-app/
├── lib/
│   ├── models/         # Data models (e.g., Country)
│   ├── services/       # API service logic
│   ├── providers/      # State management with Provider
│   ├── screens/        # UI screens (Home, Detail, Favorites)
│   └── main.dart       # App entry point
├── pubspec.yaml        # Dependencies and project configuration
└── README.md           # This file
Dependencies
http: For API calls.
provider: For state management.
shared_preferences: For persisting favorites.
Add these to pubspec.yaml and run flutter pub get.

API
The app uses the REST Countries API with the endpoint:

text

Collapse

Wrap

Copy
https://restcountries.com/v3.1/independent?status=true&fields=name,population,flag,area

![image](https://github.com/user-attachments/assets/d8bb58c8-c153-40ea-9f1a-38729f1f3dae)
![image](https://github.com/user-attachments/assets/74b79a91-2a84-4e83-925a-2790b516e89e)
![image](https://github.com/user-attachments/assets/bc6a1c54-27fd-4053-aff5-bff13a33a156)
![image](https://github.com/user-attachments/assets/7af86a5a-618d-4518-bfb0-a3698587f596)
![image](https://github.com/user-attachments/assets/743c2057-c0f5-409e-b40d-2dfb4ae9f7c6)





