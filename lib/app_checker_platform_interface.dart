import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_checker_method_channel.dart';

abstract class AppCheckerPlatform extends PlatformInterface {
  /// Constructs a AppCheckerPlatform.
  AppCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppCheckerPlatform _instance = MethodChannelAppChecker();

  /// The default instance of [AppCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppChecker].
  static AppCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppCheckerPlatform] when
  /// they register themselves.
  static set instance(AppCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
