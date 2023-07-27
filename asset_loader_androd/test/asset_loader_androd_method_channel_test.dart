import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asset_loader_androd/asset_loader_androd_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAssetLoaderAndrod platform = MethodChannelAssetLoaderAndrod();
  const MethodChannel channel = MethodChannel('asset_loader_androd');

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
