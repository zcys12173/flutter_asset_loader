
import 'package:asset_loader_platform_interface/asset_loader_platform_interface.dart';
import 'package:flutter/services.dart';

class AssetLoaderIos extends AssetLoaderPlatform{
  static void registerWith(){
    AssetLoaderPlatform.instance = AssetLoaderIos();
  }
  @override
  Future<String?> getPlatformVersion() async {
    return "ios_version";
  }

  @override
  Future<ByteData> load(String key) {
    return rootBundle.load(key);
  }

}