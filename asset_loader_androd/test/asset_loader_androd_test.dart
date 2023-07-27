import 'package:flutter_test/flutter_test.dart';
import 'package:asset_loader_androd/asset_loader_androd.dart';
import 'package:asset_loader_androd/asset_loader_androd_platform_interface.dart';
import 'package:asset_loader_androd/asset_loader_androd_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAssetLoaderAndrodPlatform
    with MockPlatformInterfaceMixin
    implements AssetLoaderAndrodPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AssetLoaderAndrodPlatform initialPlatform = AssetLoaderAndrodPlatform.instance;

  test('$MethodChannelAssetLoaderAndrod is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAssetLoaderAndrod>());
  });

  test('getPlatformVersion', () async {
    AssetLoaderAndrod assetLoaderAndrodPlugin = AssetLoaderAndrod();
    MockAssetLoaderAndrodPlatform fakePlatform = MockAssetLoaderAndrodPlatform();
    AssetLoaderAndrodPlatform.instance = fakePlatform;

    expect(await assetLoaderAndrodPlugin.getPlatformVersion(), '42');
  });
}
