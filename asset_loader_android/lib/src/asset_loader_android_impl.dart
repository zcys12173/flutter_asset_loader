import 'dart:convert';

import 'package:asset_loader_platform_interface/asset_loader_platform_interface.dart';
import 'package:flutter/services.dart';

class AssetLoaderAndroid extends AssetLoaderPlatform{
  static void registerWith() {
    AssetLoaderPlatform.instance = AssetLoaderAndroid();
  }

  @override
  Future<String?> getPlatformVersion() async {
    return "android_version";
  }

  @override
  Future<ByteData> load(String key) {
    final Uint8List encoded = utf8.encoder.convert(Uri(path: Uri.encodeFull(key)).path);
    final Future<ByteData>? future = ServicesBinding.instance.defaultBinaryMessenger.send('asset/load', encoded.buffer.asByteData())?.then((ByteData? asset) {
      if (asset == null) {
        return rootBundle.load(key);
      }
      return asset;
    });
    if (future == null) {
      return rootBundle.load(key);
    }
    return future;
  }
}