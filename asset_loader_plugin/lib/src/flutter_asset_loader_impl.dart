import 'package:asset_loader_android/asset_loader_android.dart';

class FlutterAssetLoader {
   Future<String?> getPlatformVersion(){
     return AssetLoaderPlatform.instance.getPlatformVersion();
   }
}