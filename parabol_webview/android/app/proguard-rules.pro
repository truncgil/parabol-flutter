# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.webview.** { *; }

# Keep MainActivity
-keep class com.truncgil.parabol.MainActivity { *; }

# WebView
-keep class android.webkit.WebView { *; }
-keep class android.webkit.WebViewClient { *; }
-keep class * extends android.webkit.WebViewClient { *; }
-keepclassmembers class * extends android.webkit.WebViewClient {
    <methods>;
}

# Play Core KTX
-keep class com.google.android.play.core.** { *; }
-keep class * extends com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**
-keep class kotlin.** { *; }
-keep class kotlinx.** { *; }

# Keep common dependencies
-keep class androidx.annotation.Keep

# Keep entry points
-keep class * extends android.app.Application { *; }
-keep class * extends android.app.Activity { *; }
-keep class * extends android.app.Service { *; }
-keep class * extends android.content.BroadcastReceiver { *; }
-keep class * extends android.content.ContentProvider { *; }

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep Parcelables
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

# Keep Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep R8 rules
-keepattributes SourceFile,LineNumberTable
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions

# Additional WebView rules
-keepclassmembers class * extends android.webkit.WebChromeClient {
    <methods>;
}
-keepclassmembers class * extends android.webkit.WebResourceRequest {
    <methods>;
}

# Flutter WebView Plugin specific rules
-keep class io.flutter.plugins.webviewflutter.** { *; }
-keep class io.flutter.plugins.urllauncher.** { *; }

# Keep JavaScript Interface
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
} 