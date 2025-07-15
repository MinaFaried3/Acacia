

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {

    namespace = "com.acacia.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

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
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }
//    signingConfigs {
//        create("release") {
//            keyAlias = keystoreProperties["keyAlias"] as String
//            keyPassword = keystoreProperties["keyPassword"] as String
//            storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
//            storePassword = keystoreProperties["storePassword"] as String
//        }
//    }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
//            signingConfig = signingConfigs.getByName("release")
        }
    }
    buildFeatures {
        buildConfig = true
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
}}
    dependencies {
        // Multidex support for apps with over 64K methods
        implementation("androidx.multidex:multidex:2.0.1")

        // Desugaring for Java 8+ language features on lower Android versions
        coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:1.2.2")

    }
flutter {
    source = "../.."
}
