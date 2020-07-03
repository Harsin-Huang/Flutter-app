import 'package:flutter/material.dart';
import './store/index.dart';
import './page/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: Store.init(child: new MainAPP()),
    );
  }
}
