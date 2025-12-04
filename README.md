# Flappy Bird Flutter Game 🐦

A fun and addictive Flappy Bird clone built with Flutter and Flame game engine. Play on both Android and iOS devices!

## Features ✨

- 🎮 Simple tap-to-flap gameplay
- 🏆 Real-time score tracking
- 💥 Collision detection
- 🎨 Smooth animations
- 📱 Works on Android & iOS
- 🎯 Progressive difficulty

## Prerequisites 📋

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- Android Studio or Xcode (for mobile development)
- A physical device or emulator

## Installation 🚀

### 1. Clone the Repository

```bash
git clone https://github.com/eng-neelpatel/flappy-bird-flutter.git
cd flappy-bird-flutter
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

**On a connected device/emulator:**
```bash
flutter run
```

**For a specific platform:**
```bash
flutter run -d android
flutter run -d ios
```

## Building for Production 📦

### Android APK (for direct installation)

**Debug APK (for testing):**
```bash
flutter build apk --debug
```
The APK will be located at: `build/app/outputs/flutter-apk/app-debug.apk`

**Release APK:**
```bash
flutter build apk --release
```
The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

**Release App Bundle (for Play Store):**
```bash
flutter build appbundle --release
```

### iOS Build

**For iOS, you'll need a Mac with Xcode:**

1. Open the project in Xcode:
```bash
open ios/Runner.xcworkspace
```

2. Configure signing in Xcode (select your Team)

3. Build for device:
```bash
flutter build ios --release
```

4. For TestFlight distribution:
   - Archive the app in Xcode
   - Upload to App Store Connect
   - Add testers via TestFlight

## How to Install APK on Android 📲

### Method 1: Direct Transfer
1. Build the APK using the command above
2. Connect your Android device via USB
3. Enable "Install from Unknown Sources" in Settings
4. Transfer the APK file to your device
5. Open the APK file on your device and install

### Method 2: ADB Install
```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

### Method 3: Share via Link
1. Upload the APK to a file hosting service (Google Drive, Dropbox, etc.)
2. Share the link with others
3. They can download and install on their devices

## How to Play 🎮

1. **Start Game**: Tap "Start Game" on the main menu
2. **Fly**: Tap anywhere on the screen to make the bird flap
3. **Avoid Pipes**: Navigate through the gaps without hitting pipes
4. **Score**: Each pipe you pass increases your score
5. **Game Over**: Hit a pipe or the ground to end the game
6. **Restart**: Tap "Restart" to play again

## Project Structure 📁

```
flappy-bird-flutter/
├── lib/
│   ├── main.dart                 # App entry point & UI
│   ├── flappy_bird_game.dart     # Main game logic
│   └── components/
│       ├── bird.dart             # Bird component with physics
│       ├── pipe.dart             # Pipe obstacles
│       └── background.dart       # Background component
├── pubspec.yaml                   # Dependencies
└── README.md                      # This file
```

## Technologies Used 🛠️

- **Flutter**: Cross-platform mobile framework
- **Flame**: 2D game engine for Flutter
- **Dart**: Programming language

## Key Components 🔑

### Bird
- Gravity physics
- Tap-to-flap mechanic
- Collision detection

### Pipes
- Random height generation
- Continuous scrolling
- Score triggers

### Game Logic
- State management
- Score tracking
- Game over detection
- Reset functionality

## Troubleshooting 🔧

**Build Errors:**
- Run `flutter clean` then `flutter pub get`
- Ensure Flutter SDK is up to date: `flutter upgrade`

**Android Build Issues:**
- Check minimum SDK version in `android/app/build.gradle`
- Ensure Android SDK tools are installed

**iOS Build Issues:**
- Update CocoaPods: `pod repo update`
- Clean build folder in Xcode

## Contributing 🤝

Feel free to fork this project and submit pull requests!

## License 📄

This project is open source and available under the MIT License.

## Author ✍️

**Neel Patel**  
GitHub: [@eng-neelpatel](https://github.com/eng-neelpatel)

## Acknowledgments 🙏

- Built with Flutter & Flame
- Inspired by the original Flappy Bird game

---

⭐ Star this repo if you found it helpful!
