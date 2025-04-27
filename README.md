# dhgc_mobilio_app
Mobilio Coding Challege

Run: "flutter pub get"
Run: "flutter pub run build_runner build --delete-conflicting-outputs" to generate file "product_bloc.freezed.dart"

In "android/app/build.gradle.kts", config:
- ndkVersion = "29.0.13113456"    // this depends on your ndk version, for me is "./Android/Sdk/ndk/29.0.13113456"
- sourceCompatibility = JavaVersion.VERSION_17    // this depends on your java version
- targetCompatibility = JavaVersion.VERSION_17    // this depends on your java version
- jvmTarget = JavaVersion.VERSION_17.toString()    // this depends on your java version

Running the Flutter App:
- Check Device Connection: Open a terminal and run the command: "flutter doctor"
- Run the App in Debug Mode: Use the following command to run your Flutter app in debug mode: "flutter run"
- Run the App in Release Mode: For better performance, run your app in release mode using: "flutter run --release"
