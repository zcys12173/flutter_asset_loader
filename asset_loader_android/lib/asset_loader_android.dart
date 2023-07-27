
import 'asset_loader_android_platform_interface.dart';

class AssetLoaderAndroid {
  Future<String?> getPlatformVersion() {
    return AssetLoaderAndroidPlatform.instance.getPlatformVersion();
  }
}
