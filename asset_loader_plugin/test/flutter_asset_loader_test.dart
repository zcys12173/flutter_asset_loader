import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_asset_loader/flutter_asset_loader.dart';
import 'package:flutter_asset_loader/flutter_asset_loader_platform_interface.dart';
import 'package:flutter_asset_loader/flutter_asset_loader_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAssetLoaderPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAssetLoaderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAssetLoaderPlatform initialPlatform = FlutterAssetLoaderPlatform.instance;

  test('$MethodChannelFlutterAssetLoader is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAssetLoader>());
  });

  test('getPlatformVersion', () async {
    FlutterAssetLoader flutterAssetLoaderPlugin = FlutterAssetLoader();
    MockFlutterAssetLoaderPlatform fakePlatform = MockFlutterAssetLoaderPlatform();
    FlutterAssetLoaderPlatform.instance = fakePlatform;

    expect(await flutterAssetLoaderPlugin.getPlatformVersion(), '42');
  });
}
