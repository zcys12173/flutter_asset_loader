# flutter_asset_loader
Flutter资源加载插件。支持flutter加载原生侧的图片，防止Flutter和原生侧的图片重复。适用于混合工程，尤其是纯原生向Flutter迁移阶段。

## 支持的功能
1. 图片加载，可以从原生侧加载图片资源


## 支持的系统
`android` `ios`

## 引用
`pubspec.yaml`

```yaml
dependencies:
  flutter_asset_loader:
    git:
      url: https://github.com/zcys12173/flutter_asset_loader.git
      path: ./asset_loader_plugin
```

## 用法  

在根Widget外层使用AssetBundleWidget包裹  

```dart
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AssetBundleWidget(
        priority: LoadPriority.native,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Center(
              child: Image.asset("asset/image/framework_close.png"),
            ),
          ),
        ));
  }
}
```

`priority`:加载优先级;  
`LoadPriority.native`:优先从原生加载;  
`LoadPriority.flutter`:优先从Flutter侧加载（默认值）;  
