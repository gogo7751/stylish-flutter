package com.example.stylish
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.stylish"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{
      // This method is invoked on the main thread.
      call, result ->
      if (call.method == "helloFromNative") {
        val name = call.argument<String>("name")
        val greeting = "Hello, $name from Native!"
        result.success(greeting)
      } else {
        result.notImplemented()
      }
    }
  }
}
