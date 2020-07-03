import 'package:flutter/material.dart';
import '../store/index.dart' show Store, CounterModel;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    CounterModel _model =  Store.value<CounterModel>(context);
    return new Scaffold(
      appBar: AppBar(
        title: Text("Harsin"),
      ),
      body: new Center(
        child: new Text("Hello world ${_model.count}", textAlign: TextAlign.center,),
      )
    );
  }
}