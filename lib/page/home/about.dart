import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("关于我们"),
      ),
      body: new Center(
        child: new Text("关于我们", textAlign: TextAlign.center,),
      )
    );
  }
}