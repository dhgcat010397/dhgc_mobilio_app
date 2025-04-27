# dhgc_mobilio_app
Mobilio Coding Challege

run: "flutter pub get"
run: "run: flutter pub run build_runner build --delete-conflicting-outputs" to generate file "product_bloc.freezed.dart"

in  "android/app/build.gradle.kts", config:

- ndkVersion = "29.0.13113456"    // this depends on your ndk version, for me is "./Android/Sdk/ndk/29.0.13113456"
- sourceCompatibility = JavaVersion.VERSION_17    // this depends on your java version
- targetCompatibility = JavaVersion.VERSION_17    // this depends on your java version
- jvmTarget = JavaVersion.VERSION_17.toString()    // this depends on your java version

