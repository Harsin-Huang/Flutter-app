import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("空页面"),
      ),
      body: new Center(
        child: new Text("什么也没有!", textAlign: TextAlign.center,),
      )
    );
  }
}