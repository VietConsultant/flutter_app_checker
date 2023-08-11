import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppChecker {
  static const MethodChannel _channel = MethodChannel('app_checker');

  static Future<bool> isAppInstalled(String schema) async {
    try {
      final bool isInstalled =
          await _channel.invokeMethod('isAppInstalled', {'schema': schema});
      return isInstalled;
    } catch (e) {
      debugPrint('Error checking app installation: $e');
      return false;
    }
  }
}
