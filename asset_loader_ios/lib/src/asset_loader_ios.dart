import 'package:asset_loader_platform_interface/asset_loader_platform_interface.dart';

class AssetLoaderIos extends AssetLoaderPlatform{
  static void registerWith(){
    AssetLoaderPlatform.instance = AssetLoaderIos();
  }
  @override
  Future<String?> getPlatformVersion() async {
    return "ios_version";
  }

}