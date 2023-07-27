import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'asset_loader_androd_platform_interface.dart';

/// An implementation of [AssetLoaderAndrodPlatform] that uses method channels.
class MethodChannelAssetLoaderAndrod extends AssetLoaderAndrodPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('asset_loader_androd');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
