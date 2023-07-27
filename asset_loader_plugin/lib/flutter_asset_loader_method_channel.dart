import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_asset_loader_platform_interface.dart';

/// An implementation of [FlutterAssetLoaderPlatform] that uses method channels.
class MethodChannelFlutterAssetLoader extends FlutterAssetLoaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_asset_loader');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
