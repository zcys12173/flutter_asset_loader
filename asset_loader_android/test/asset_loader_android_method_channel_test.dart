import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asset_loader_android/asset_loader_android_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAssetLoaderAndroid platform = MethodChannelAssetLoaderAndroid();
  const MethodChannel channel = MethodChannel('asset_loader_android');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
