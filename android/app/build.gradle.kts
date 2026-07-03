import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

configurations.all {
    val tinkAndroid = "com.google.crypto.tink:tink-android:1.21.0"
    resolutionStrategy {
        force(tinkAndroid)
        dependencySubstitution {
            substitute(module("com.google.crypto.tink:tink")).using(module(tinkAndroid))
        }
    }
}

val requestedTasks = gradle.startParameter.taskNames.joinToString(" ").lowercase()
if (requestedTasks.contains("fcm")) {
    apply(plugin = "com.google.gms.google-services")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
val hasKeystoreProperties = keystorePropertiesFile.exists()
if (hasKeystoreProperties) {
    keystorePropertiesFile.inputStream().use { inputStream ->
        keystoreProperties.load(inputStream)
    }
}

android {
    namespace = "com.fluxer"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion
    flavorDimensions += listOf("environment", "push")

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    signingConfigs {
        getByName("debug") {
            storeFile = file("debug.keystore")
            storePassword = "canary-debug"
            keyAlias = "canary"
            keyPassword = "canary-debug"
        }
    }

    defaultConfig {
        applicationId = "com.fluxer"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
        manifestPlaceholders["appLabel"] = "Fluxer"
        manifestPlaceholders["buildEnvironment"] = "stable"
        manifestPlaceholders["pushProvider"] = "fcm"
    }

    productFlavors {
        create("canary") {
            dimension = "environment"
            applicationIdSuffix = ".canary"
            versionNameSuffix = "-canary"
            manifestPlaceholders["appLabel"] = "Fluxer Canary"
            manifestPlaceholders["buildEnvironment"] = "canary"
        }
        create("stable") {
            dimension = "environment"
            manifestPlaceholders["appLabel"] = "Fluxer"
            manifestPlaceholders["buildEnvironment"] = "stable"
        }
        create("beta") {
            dimension = "environment"
            manifestPlaceholders["appLabel"] = "Fluxer Beta"
            manifestPlaceholders["buildEnvironment"] = "beta"
        }
        create("fcm") {
            dimension = "push"
            manifestPlaceholders["pushProvider"] = "fcm"
        }
        create("unifiedpush") {
            dimension = "push"
            manifestPlaceholders["pushProvider"] = "unifiedpush"
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            signingConfig = if (hasKeystoreProperties) {
                signingConfigs.create("release") {
                    val storeFilePath = keystoreProperties["storeFile"] as String
                    storeFile = file(storeFilePath)
                    storePassword = keystoreProperties["storePassword"] as String
                    keyAlias = keystoreProperties["keyAlias"] as String
                    keyPassword = keystoreProperties["keyPassword"] as String
                }
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }

    testOptions {
        unitTests.isIncludeAndroidResources = true
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
    add("fcmImplementation", platform("com.google.firebase:firebase-bom:33.9.0"))
    add("fcmImplementation", "com.google.firebase:firebase-messaging")
    add("fcmImplementation", "com.google.android.gms:play-services-cloud-messaging")
}
