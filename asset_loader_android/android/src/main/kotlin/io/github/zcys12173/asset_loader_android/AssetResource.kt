package io.github.zcys12173.asset_loader_android

/**
 * 资源类
 * @param name 资源名称
 * @param suffix 资源后缀
 * @param path 资源全路径
 * @sample "asset/image/ic.png" ->  name=ic; suffix=png; path=asset/image/ic.png;
 */
data class AssetResource(val name:String,val suffix:String,val path:String)

fun String.toAssetResource():AssetResource{
    val name = substringAfterLast("/")
    val split = name.split(".")
    val resId = split.getOrElse(0){""}
    val suffix = split.getOrElse(1){""}
    return AssetResource(resId,suffix,this)
}

