import Flutter
import UIKit

public class FlutterAssetLoaderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_asset_loader", binaryMessenger: registrar.messenger())
    let instance = FlutterAssetLoaderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
