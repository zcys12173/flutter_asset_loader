import 'package:flutter_test/flutter_test.dart';
import 'package:asset_loader_android/asset_loader_android.dart';
import 'package:asset_loader_android/asset_loader_android_platform_interface.dart';
import 'package:asset_loader_android/asset_loader_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAssetLoaderAndroidPlatform
    with MockPlatformInterfaceMixin
    implements AssetLoaderAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AssetLoaderAndroidPlatform initialPlatform = AssetLoaderAndroidPlatform.instance;

  test('$MethodChannelAssetLoaderAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAssetLoaderAndroid>());
  });

  test('getPlatformVersion', () async {
    AssetLoaderAndroid assetLoaderAndroidPlugin = AssetLoaderAndroid();
    MockAssetLoaderAndroidPlatform fakePlatform = MockAssetLoaderAndroidPlatform();
    AssetLoaderAndroidPlatform.instance = fakePlatform;

    expect(await assetLoaderAndroidPlugin.getPlatformVersion(), '42');
  });
}
