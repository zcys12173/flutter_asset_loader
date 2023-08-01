import 'package:asset_loader_android/asset_loader_android.dart';
import 'package:flutter/services.dart';
import 'package:flutter_asset_loader/flutter_asset_loader.dart';

///create by syc , 2023/8/1
class FlutterAssetBundle extends CachingAssetBundle {
  LoadPriority priority =  LoadPriority.flutter;
  OnKeyBuilder? keyBuilder;

  @override
  Future<ByteData> load(String key) async {
    if (key == "AssetManifest.bin") {
      return await rootBundle.load(key);
    }
    switch (priority) {
      case LoadPriority.flutter:
        {
          return await loadFromFlutterFirst(key);
        }
      case LoadPriority.native:
        {
          return await loadFromNativeFirst(key);
        }
      case LoadPriority.flutterOnly:
        {
          return await loadFromFlutterOnly(key);
        }
      case LoadPriority.nativeOnly:
        {
          return await loadFromNativeOnly(key);
        }
    }
  }

  Future<ByteData> loadFromFlutterFirst(String key) async {
    try {
      return await loadFromFlutterOnly(key);
    } catch (e) {
      return await loadFromNativeOnly(key);
    }
  }

  Future<ByteData> loadFromNativeFirst(String key) async {
    try {
      return await loadFromNativeOnly(key);
    } catch (e) {
      return await loadFromFlutterOnly(key);
    }
  }

  Future<ByteData> loadFromNativeOnly(String key) async {
    var nativeKey = keyBuilder?.call(key) ?? key;
    return await AssetLoaderPlatform.instance.load(nativeKey);
  }

  Future<ByteData> loadFromFlutterOnly(String key) async {
    return await rootBundle.load(key);
  }
}
