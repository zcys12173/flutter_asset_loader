import 'package:asset_loader_android/asset_loader_android.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AssetBundleWidget extends StatelessWidget {
  final Widget child;
  final LoadPriority priority;

  AssetBundleWidget(
      {super.key, required this.child, this.priority = LoadPriority.flutter}) {
    _assetLoaderBundle.priority = priority;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(bundle: _assetLoaderBundle, child: child);
  }
}

var _assetLoaderBundle = _FlutterAssetBundle(priority: LoadPriority.flutter);

class _FlutterAssetBundle extends CachingAssetBundle {
  LoadPriority priority;

  _FlutterAssetBundle({this.priority = LoadPriority.flutter});

  @override
  Future<ByteData> load(String key) async {
    if (priority == LoadPriority.flutter) {
      try {
        return await rootBundle.load(key);
      } catch (e) {
        return await AssetLoaderPlatform.instance.load(key);
      }
    } else {
      try {
        return await AssetLoaderPlatform.instance.load(key);
      } catch (e) {
        return await rootBundle.load(key);
      }
    }
  }
}

enum LoadPriority { flutter, native }
