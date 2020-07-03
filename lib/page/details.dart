import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int detailsId;
  DetailsPage({ Key key, @required this.detailsId }):super(key: key);
  @override
  createState() => new DetailsPageState();
}


class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("详情页面"),
      ),
      body: new Center(
        child: new Text("详情页面", textAlign: TextAlign.center,),
      )
    );
  }
}
