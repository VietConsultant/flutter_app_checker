import 'package:flutter_test/flutter_test.dart';
import 'package:app_checker/app_checker.dart';
import 'package:app_checker/app_checker_platform_interface.dart';
import 'package:app_checker/app_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppCheckerPlatform
    with MockPlatformInterfaceMixin
    implements AppCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppCheckerPlatform initialPlatform = AppCheckerPlatform.instance;

  test('$MethodChannelAppChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppChecker>());
  });

  test('getPlatformVersion', () async {
    AppChecker appCheckerPlugin = AppChecker();
    MockAppCheckerPlatform fakePlatform = MockAppCheckerPlatform();
    AppCheckerPlatform.instance = fakePlatform;

    expect(await appCheckerPlugin.getPlatformVersion(), '42');
  });
}
