
import 'asset_loader_androd_platform_interface.dart';

class AssetLoaderAndrod {
  Future<String?> getPlatformVersion() {
    return AssetLoaderAndrodPlatform.instance.getPlatformVersion();
  }
}
