plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.acacia.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11

    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.acacia.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true // ✅ Enable multidex
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    flavorDimensions += "app"
    productFlavors {
        create("prod") {
            dimension = "app"
            resValue("string", "app_name", "Acacia")
            resValue("string", "facebook_app_id", "")
            resValue("string", "fb_login_protocol_scheme", "")
            resValue("string", "facebook_client_token", "")
            manifestPlaceholders["MAPS_API_KEY"] = ""
        }

        create("dev") {
            dimension = "app"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "Acacia Dev")
            resValue("string", "facebook_app_id", "")
            resValue("string", "fb_login_protocol_scheme", "")
            resValue("string", "facebook_client_token", "")
            manifestPlaceholders["MAPS_API_KEY"] = ""
        }
    }
}
dependencies {
    // Multidex support for apps with over 64K methods
    implementation("androidx.multidex:multidex:2.0.1")

    // Desugaring for Java 8+ language features on lower Android versions
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:1.2.2")
    // Import the Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:33.16.0"))


    // TODO: Add the dependencies for Firebase products you want to use
    // When using the BoM, don't specify versions in Firebase dependencies
    implementation("com.google.firebase:firebase-analytics")


}

flutter {
    source = "../.."
}
