import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'asset_loader_android_method_channel.dart';

abstract class AssetLoaderAndroidPlatform extends PlatformInterface {
  /// Constructs a AssetLoaderAndroidPlatform.
  AssetLoaderAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static AssetLoaderAndroidPlatform _instance = MethodChannelAssetLoaderAndroid();

  /// The default instance of [AssetLoaderAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelAssetLoaderAndroid].
  static AssetLoaderAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AssetLoaderAndroidPlatform] when
  /// they register themselves.
  static set instance(AssetLoaderAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
