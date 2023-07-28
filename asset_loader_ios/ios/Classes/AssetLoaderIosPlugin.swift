import Flutter
import UIKit

public class AssetLoaderIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      print("register AssetLoaderIosPlugin")
      registrar.messenger().setMessageHandlerOnChannel("asset/load"){(message,reply) in
          if let data = message as Data? {
              if let messageString = String(data: data, encoding: .utf8) {
                  // 使用 messageString
                  print("准备加载资源:"+messageString)
                  if let url = URL(string: messageString) {
                      let fileNameWithExtension = url.lastPathComponent
                      let fileExtension = url.pathExtension
                      let fileName = (fileNameWithExtension as NSString).deletingPathExtension
                      print("资源名称: \(fileName)")
                      print("资源类型: \(fileExtension)")
                      if(fileExtension == "png" || fileExtension == "jpg" || fileExtension == "jpeg" || fileExtension == "webp"){
                          if let image = UIImage(named: fileName) {
                              print("找到本地图片资源")
                              // 将 UIImage 转换成 NSData
                              if let imageData = image.pngData() {
                                  reply(imageData)
                                  return
                              }
                          }else{
                              print("没有找到本地图片资源")
                          }
                      }else{
                          print("不支持的图片类型")
                      }
                      
                  }
              } else {
                  // 无法将 NSData 转换成 String
                  print("无法将 NSData 转换成 String")
              }
          } else {
              // message 为 nil 或者不是 NSData 类型
              print(" message 为 nil 或者不是 NSData 类型")
          }
          print("返回空资源")
          reply(nil)
      }

  }

}
