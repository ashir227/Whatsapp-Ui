plugins {
    id("com.android.application")
    id("kotlin-android")

    // Flutter Gradle plugin (ALWAYS after Android + Kotlin)
    id("dev.flutter.flutter-gradle-plugin")

    // 🔥 Firebase Google Services plugin
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.whatsap"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "26.1.10909125"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.whatsap"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Flutter debug signing for now
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
        }
    }
}

dependencies {

    // 🔥 Firebase BOM (controls all Firebase versions)
    implementation(platform("com.google.firebase:firebase-bom:34.9.0"))

    // 🔥 Firebase Auth (OTP / Phone Auth)
    implementation 'com.google.firebase:firebase-analytics'

}

flutter {
    source = "../.."
}
