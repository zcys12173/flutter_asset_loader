import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'asset_loader_androd_method_channel.dart';

abstract class AssetLoaderAndrodPlatform extends PlatformInterface {
  /// Constructs a AssetLoaderAndrodPlatform.
  AssetLoaderAndrodPlatform() : super(token: _token);

  static final Object _token = Object();

  static AssetLoaderAndrodPlatform _instance = MethodChannelAssetLoaderAndrod();

  /// The default instance of [AssetLoaderAndrodPlatform] to use.
  ///
  /// Defaults to [MethodChannelAssetLoaderAndrod].
  static AssetLoaderAndrodPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AssetLoaderAndrodPlatform] when
  /// they register themselves.
  static set instance(AssetLoaderAndrodPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
