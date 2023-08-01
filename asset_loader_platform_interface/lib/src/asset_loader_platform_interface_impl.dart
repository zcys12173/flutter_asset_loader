
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class AssetLoaderPlatform extends PlatformInterface {
  /// Constructs a AssetLoaderPlatform.
  AssetLoaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static late AssetLoaderPlatform _instance;

  /// The default instance of [AssetLoaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelAssetLoaderAndroid].
  static AssetLoaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AssetLoaderPlatform] when
  /// they register themselves.
  static set instance(AssetLoaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<ByteData> load(String key);


}
