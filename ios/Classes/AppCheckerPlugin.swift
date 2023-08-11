import Flutter
import UIKit

public class AppCheckerPlugin: NSObject, FlutterPlugin {
 public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_checker", binaryMessenger: registrar.messenger())
    let instance = SwiftAppCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "isAppInstalled" {
      if let schema = call.arguments as? String, let url = URL(string: schema) {
        let isInstalled = UIApplication.shared.canOpenURL(url)
        result(isInstalled)
      } else {
        result(false)
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}