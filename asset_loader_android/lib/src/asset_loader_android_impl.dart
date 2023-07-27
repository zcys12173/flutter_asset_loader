import 'package:asset_loader_platform_interface/asset_loader_platform_interface.dart';

class AssetLoaderAndroid extends AssetLoaderPlatform{
  static void registerWith() {
    AssetLoaderPlatform.instance = AssetLoaderAndroid();
  }

  @override
  Future<String?> getPlatformVersion() async {
    return "android_version";
  }

}