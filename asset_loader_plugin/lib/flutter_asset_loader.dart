
import 'flutter_asset_loader_platform_interface.dart';

class FlutterAssetLoader {
  Future<String?> getPlatformVersion() {
    return FlutterAssetLoaderPlatform.instance.getPlatformVersion();
  }
}
