package com.vietconsultant.appchecker.app_checker

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AppCheckerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
  private lateinit var context: Context
  private lateinit var channel: MethodChannel
  private var activityPluginBinding: ActivityPluginBinding? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_checker")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    if (call.method == "isAppInstalled") {
      val schema = call.argument<String>("schema")
      val isInstalled = isAppInstalled(schema)
      result.success(isInstalled)
    } else {
      result.notImplemented()
    }
  }

  private fun isAppInstalled(schema: String?): Boolean {
    if (schema == null) return false

    val intent = Intent(Intent.ACTION_VIEW, Uri.parse(schema))
    val packageManager: PackageManager = context.packageManager
    val activities = packageManager.queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY)

    return activities.isNotEmpty()
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activityPluginBinding = binding
  }

  override fun onDetachedFromActivity() {
    activityPluginBinding = null
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activityPluginBinding = binding
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activityPluginBinding = null
  }
}
