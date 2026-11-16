# Extra R8 rules for this app. The Flutter Gradle plugin always merges in
# packages/flutter_tools/gradle/flutter_proguard_rules.pro from the Flutter SDK.

-keepattributes Signature
-keepattributes *Annotation*

-repackageclasses

-keep class com.hiennv.flutter_callkit_incoming.Data { *; }
-keepclassmembers class * {
    @com.fasterxml.jackson.annotation.* *;
}
-keep,allowobfuscation,allowshrinking class * extends com.fasterxml.jackson.core.type.TypeReference
-keepnames class com.fasterxml.jackson.** { *; }
-keep class com.fasterxml.jackson.databind.ext.** { <init>(); }
-dontwarn com.fasterxml.jackson.**

-keepattributes *JavascriptInterface*
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keepclassmembers class com.pichillilorenzo.flutter_inappwebview_android.webview.JavaScriptBridgeInterface {
    public *;
}
-dontwarn android.window.BackEvent
