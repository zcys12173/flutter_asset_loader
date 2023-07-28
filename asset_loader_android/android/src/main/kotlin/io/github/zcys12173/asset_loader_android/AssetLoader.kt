package io.github.zcys12173.asset_loader_android


object AssetLoader {
    var listeners:OnAssetLoadListener?=null


    fun load(key:String):ByteArray?{
        return listeners?.load(key)
    }

}

interface OnAssetLoadListener{
    fun load(key:String): ByteArray?
}