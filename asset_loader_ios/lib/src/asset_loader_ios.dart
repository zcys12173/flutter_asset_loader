import 'dart:convert';

import 'package:asset_loader_platform_interface/asset_loader_platform_interface.dart';
import 'package:flutter/services.dart';

class AssetLoaderIos extends AssetLoaderPlatform {
  static void registerWith() {
    AssetLoaderPlatform.instance = AssetLoaderIos();
  }

  @override
  Future<ByteData> load(String key) async{
    final Uint8List encoded = utf8.encoder.convert(Uri(path: Uri.encodeFull(key)).path);
    var result =  await ServicesBinding.instance.defaultBinaryMessenger.send('asset/load', encoded.buffer.asByteData());
    if(result == null){
      throw Exception("asset $key not found from ios");
    }
    return result;
  }
}
