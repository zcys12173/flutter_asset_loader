package io.github.zcys12173.asset_loader_android

import android.content.Context
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import androidx.core.content.ContextCompat
import java.io.ByteArrayOutputStream


object AssetLoader {
    var listener: OnAssetLoadListener? = null

    fun load(key: String): ByteArray? {
        return listener?.load(key)
    }

}

interface OnAssetLoadListener {
    fun load(key: String): ByteArray?
}


/**
 * 默认资源加载监听器
 */
open class DefaultAssetLoadListener(private val context: Context) : OnAssetLoadListener {
    override fun load(key: String): ByteArray? {
        val res = key.toAssetResource()
        if (isSupportPictureSource(res.suffix)) {
            val resId =
                context.resources.getIdentifier(res.name, "drawable", context.packageName)
            if (resId == 0) {
                return null
            }
            val drawable = ContextCompat.getDrawable(context, resId) as? BitmapDrawable
            return drawable?.run {
                val outputStream = ByteArrayOutputStream()
                val compressFormat = when (res.suffix) {
                    "png" -> Bitmap.CompressFormat.PNG
                    "jpg", "jpeg" -> Bitmap.CompressFormat.JPEG
                    "webp" -> Bitmap.CompressFormat.WEBP
                    else -> Bitmap.CompressFormat.PNG
                }
                drawable.bitmap.compress(compressFormat, 100, outputStream)
                outputStream.toByteArray()
            }
        } else {
            return null
        }
    }

    private fun isSupportPictureSource(suffix: String): Boolean {
        return suffix == "png" || suffix == "jpg" || suffix == "jpeg" || suffix == "webp"
    }
}