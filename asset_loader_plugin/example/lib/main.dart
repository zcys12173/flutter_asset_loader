import 'package:flutter/material.dart';
import 'package:flutter_asset_loader/flutter_asset_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

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
