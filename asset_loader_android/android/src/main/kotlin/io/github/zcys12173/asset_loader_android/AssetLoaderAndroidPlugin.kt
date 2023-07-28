package io.github.zcys12173.asset_loader_android

import io.flutter.embedding.engine.plugins.FlutterPlugin
import java.nio.ByteBuffer
import java.nio.charset.Charset

/** AssetLoaderAndroidPlugin */

private const val HANDLER_NAME = "asset/load"

class AssetLoaderAndroidPlugin : FlutterPlugin {
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        flutterPluginBinding.binaryMessenger.setMessageHandler(HANDLER_NAME) { message, reply ->
            val result:ByteBuffer? = message?.run {
                val assetKey = decodeMessage(message)
                val byteArray = AssetLoader.load(assetKey)
                byteArray?.run {
                    ByteBuffer.allocateDirect(size).apply {
                        put(byteArray)
                    }
                }
            }
            reply.reply(result)
        }
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binding.binaryMessenger.setMessageHandler(HANDLER_NAME, null)
    }

    private fun decodeMessage(message: ByteBuffer): String {
        val bytes: ByteArray
        val offset: Int
        val length = message.remaining()
        if (message.hasArray()) {
            bytes = message.array()
            offset = message.arrayOffset()
        } else {
            bytes = ByteArray(length)
            message[bytes]
            offset = 0
        }
        return String(bytes, offset, length, Charset.forName("UTF8"))
    }

}
