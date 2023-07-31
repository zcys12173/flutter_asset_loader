import 'package:asset_loader_android/asset_loader_android.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AssetBundleWidget extends StatelessWidget {
  final Widget child;

  AssetBundleWidget(
      {super.key, required this.child, priority = LoadPriority.flutter,OnKeyBuilder? keyBuilder}) {
    _assetLoaderBundle
    ..priority = priority
    ..keyBuilder = keyBuilder;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(bundle: _assetLoaderBundle, child: child);
  }
}

var _assetLoaderBundle = _FlutterAssetBundle(priority: LoadPriority.flutter);

class _FlutterAssetBundle extends CachingAssetBundle {
  LoadPriority priority;
  OnKeyBuilder? keyBuilder;

  _FlutterAssetBundle({this.priority = LoadPriority.flutter});

  @override
  Future<ByteData> load(String key) async {
    if(key == "AssetManifest.bin"){
      return await rootBundle.load(key);
    }
    if (priority == LoadPriority.flutter) {
      try {
        return await rootBundle.load(key);
      } catch (e) {
        var nativeKey = keyBuilder?.call(key)??key;
        return await AssetLoaderPlatform.instance.load(nativeKey);
      }
    } else {
      try {
        var nativeKey = keyBuilder?.call(key)??key;
        return await AssetLoaderPlatform.instance.load(nativeKey);
      } catch (e) {
        return await rootBundle.load(key);
      }
    }
  }
}

enum LoadPriority { flutter, native }

typedef OnKeyBuilder = String Function(String key);
