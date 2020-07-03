import 'package:flutter/material.dart';

class ConfigInfo {
  String version = '1.0';
}

//混入
class CounterModel extends ConfigInfo with ChangeNotifier{
  int count = 99;
  increment(){
    count += 1;
    //发送通知
    NotificationListener();
  }
}