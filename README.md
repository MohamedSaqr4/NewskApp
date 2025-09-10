<<<<<<< HEAD
# 📰 News App
=======
# NewskApp# 📰  
>>>>>>> 3994604bab2bf54a6602e9b3e8cadea26bfadab7

A modern Flutter news application with multilingual support, built using clean architecture principles and state management with BLoC pattern.

## ✨ Features

- 🌍 **Multilingual Support** - English and Arabic localization
- 📱 **Responsive Design** - Adaptive UI for different screen sizes
- 🔍 **Search Functionality** - Find news articles by keywords
- 📰 **Top Headlines** - Latest news from various categories
- 🎨 **Modern UI** - Clean and intuitive user interface
- 🏗️ **Clean Architecture** - Well-structured codebase with separation of concerns
- 🔄 **State Management** - BLoC pattern for efficient state handling
- 🌐 **API Integration** - Real-time news data from external sources

## 🛠️ Tech Stack

- **Framework**: Flutter 3.13.2
- **Language**: Dart 3.1.0
- **State Management**: flutter_bloc ^8.1.6
- **Navigation**: go_router ^13.2.0
- **Localization**: easy_localization 3.0.7
- **HTTP Client**: dio ^5.9.0
- **Image Caching**: cached_network_image ^3.2.0
- **UI Responsiveness**: flutter_screenutil ^5.9.3
- **Dependency Injection**: get_it ^8.2.0
- **Fonts**: google_fonts ^4.0.3
- **Logging**: pretty_dio_logger ^1.4.0

## 📁 Project Structure

```
lib/
├── core/
│   ├── api/                 # API configuration and consumers
│   ├── constant.dart        # App constants
│   ├── errors/             # Error handling classes
│   ├── routes/             # App routing configuration
│   ├── styles/             # Theme and styling
│   └── widgets/            # Reusable UI components
├── features/
│   ├── home/               # Home screen feature
│   │   ├── data/           # Data layer (models, repositories)
│   │   ├── presentation/   # UI and business logic
│   │   └── domain/         # Business entities
│   ├── news_details/       # News details feature
│   └── search_result/      # Search functionality
└── main.dart              # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.13.2 or higher
- Dart SDK 3.1.0 or higher
- Android Studio / VS Code
- Android SDK 34
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd news_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Android SDK**
   - Ensure Android SDK 34 is installed
   - Accept Android licenses:
     ```bash
     flutter doctor --android-licenses
     ```

4. **Run the app**
   ```bash
   # For development (without widget tracking to avoid compiler issues)
   flutter run --no-track-widget-creation
   
   # Or build APK
   flutter build apk --debug --no-track-widget-creation
   ```

## 🔧 Configuration

### Android Configuration

The app requires Android SDK 34. Make sure your `android/app/build.gradle` has:

```gradle
android {
    compileSdkVersion 34
    targetSdkVersion 34
    // ... other configurations
}
```

### Localization

The app supports English and Arabic. Translation files are located in:
- `assets/translations/en.json`
- `assets/translations/ar.json`

## 🏗️ Architecture

This project follows **Clean Architecture** principles:

- **Presentation Layer**: UI components, BLoC/Cubit, and pages
- **Domain Layer**: Business logic, entities, and use cases
- **Data Layer**: Repositories, data sources, and models

### State Management

The app uses **BLoC pattern** for state management:
- `NewsCubit` - Manages news data state
- `SearchResultCubit` - Handles search functionality

### Dependency Injection

Uses `get_it` for dependency injection to manage service instances.
<<<<<<< HEAD

## 📱 Screenshots

*Add screenshots of your app here*

## 🚨 Troubleshooting

=======
  
>>>>>>> 3994604bab2bf54a6602e9b3e8cadea26bfadab7
### Common Issues

1. **Compiler Crash with Widget Tracking**
   ```bash
   # Run without widget tracking
   flutter run --no-track-widget-creation
   ```

2. **Android SDK Version Error**
   - Ensure `compileSdkVersion` and `targetSdkVersion` are set to 34
   - Update Android SDK to version 34

3. **Easy Localization Errors**
   - The app uses `easy_localization: 3.0.7` (pinned version)
   - If you encounter syntax errors, clear pub cache:
     ```bash
     flutter pub cache repair
     flutter pub get
     ```

4. **Missing Android Licenses**
   ```bash
   flutter doctor --android-licenses
   ```

## 🔄 API Integration

The app integrates with news APIs to fetch:
- Top headlines
- Search results
- Article details

*Configure your API endpoints in the repository classes*

## 🌐 Localization

### Adding New Languages

1. Add translation file: `assets/translations/[language_code].json`
2. Update `main.dart` to include the new locale
3. Add locale to `supportedLocales` list

### Translation File Structure

```json
{
  "app_title": "News App",
  "search_hint": "Search for news...",
  "top_headlines": "Top Headlines",
  "categories": "Categories"
}
```

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 📦 Building for Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

<<<<<<< HEAD
**Abdullah Yassen**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com
=======
**Mohamed Saqr**
- GitHub: [https://github.com/MohamedSaqr4]
- Email: mohamedsaqrr57@gmail.com
>>>>>>> 3994604bab2bf54a6602e9b3e8cadea26bfadab7

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- BLoC library contributors
- All open-source packages used in this project

---

<<<<<<< HEAD
**Note**: This app is built for educational purposes. Make sure to comply with news API terms of service and respect content licensing when using real news data.
=======
**Note**: This app is built for educational purposes. Make sure to comply with news API terms of service and respect content licensing when using real news data.
>>>>>>> 3994604bab2bf54a6602e9b3e8cadea26bfadab7
