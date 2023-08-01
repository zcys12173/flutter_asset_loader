import 'package:flutter/cupertino.dart';
import 'package:flutter_asset_loader/src/flutter_asset_bundle.dart';

class AssetBundleWidget extends StatelessWidget {
  final Widget child;

  AssetBundleWidget(
      {super.key,
      required this.child,
      priority = LoadPriority.flutter,
      OnKeyBuilder? keyBuilder}) {
    assetLoaderBundle
      ..priority = priority
      ..keyBuilder = keyBuilder;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(bundle: assetLoaderBundle, child: child);
  }
}

var assetLoaderBundle = FlutterAssetBundle();

enum LoadPriority {
  ///优先从Flutter加载，Flutter没有则从Native加载
  flutter,

  ///优先从Native加载，Native没有则从Flutter加载
  native,

  ///仅从Flutter加载，不会从Native加载
  flutterOnly,

  ///仅从Native加载，不会从Flutter加载
  nativeOnly
}

typedef OnKeyBuilder = String Function(String key);
