package io.github.zcys12173.flutter.asset_loader.flutter_asset_loader_example

import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.util.Log
import androidx.core.content.ContextCompat
import io.flutter.app.FlutterApplication
import io.github.zcys12173.asset_loader_android.AssetLoader
import io.github.zcys12173.asset_loader_android.OnAssetLoadListener
import java.io.ByteArrayOutputStream

class BaseApplication:FlutterApplication() {
    override fun onCreate() {
        super.onCreate()

        AssetLoader.listeners = object : OnAssetLoadListener {
            override fun load(key: String): ByteArray? {
                Log.e("AssetLoader","key:$key")
                val resId = resources.getIdentifier(key,"drawable",packageName)
                if(resId == 0){
                    return null
                }
                val drawable = ContextCompat.getDrawable(this@BaseApplication,resId) as BitmapDrawable
                val outputStream = ByteArrayOutputStream()
                drawable.bitmap.compress(Bitmap.CompressFormat.PNG,100,outputStream)
                return outputStream.toByteArray()

            }
        }
    }
}