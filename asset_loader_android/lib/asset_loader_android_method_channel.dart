import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'asset_loader_android_platform_interface.dart';

/// An implementation of [AssetLoaderAndroidPlatform] that uses method channels.
class MethodChannelAssetLoaderAndroid extends AssetLoaderAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('asset_loader_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
