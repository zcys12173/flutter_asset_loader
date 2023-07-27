import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_asset_loader_method_channel.dart';

abstract class FlutterAssetLoaderPlatform extends PlatformInterface {
  /// Constructs a FlutterAssetLoaderPlatform.
  FlutterAssetLoaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAssetLoaderPlatform _instance = MethodChannelFlutterAssetLoader();

  /// The default instance of [FlutterAssetLoaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAssetLoader].
  static FlutterAssetLoaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAssetLoaderPlatform] when
  /// they register themselves.
  static set instance(FlutterAssetLoaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
