import 'package:asset_loader_android/asset_loader_android.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class AssetBundleWidget extends StatelessWidget {
  final Widget child;
  final _FlutterAssetBundle _bundle = _FlutterAssetBundle();

  AssetBundleWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(bundle: _bundle, child: child);
  }

}

class _FlutterAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) {
    try{
      return rootBundle.load(key);
    }catch(e){
      return AssetLoaderPlatform.instance.load(key);
    }
  }

}
