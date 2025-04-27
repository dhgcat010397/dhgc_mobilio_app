# dhgc_mobilio_app
Mobilio Coding Challege

run: "flutter pub get"
run: "run: flutter pub run build_runner build --delete-conflicting-outputs" to generate file "product_bloc.freezed.dart"

in  "android/app/build.gradle.kts", config:

> android {
>    namespace = "com.example.dhgc_mobilio_app"
>    compileSdk = flutter.compileSdkVersion
>    ndkVersion = "29.0.13113456"    // this depends on your ndk version, for me is "./Android/Sdk/ndk/29.0.13113456"
>    ...
}

> compileOptions {
>        sourceCompatibility = JavaVersion.VERSION_17    // this depends on your java version
>        targetCompatibility = JavaVersion.VERSION_17    // this depends on your java version
>    }

> kotlinOptions {
>        jvmTarget = JavaVersion.VERSION_17.toString()    // this depends on your java version
>    }
