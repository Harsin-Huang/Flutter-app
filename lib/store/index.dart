import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

// 数据模型管理
import './models/counter_model.dart' show CounterModel;
export './models/counter_model.dart' show CounterModel;


class Store {
  static BuildContext context;
  static of(BuildContext context) {
    Store.context ??= context;
    return context;
  }
  
  static init({child,context}) {
    Store.context ??= context;
    return MultiProvider(
      child: child,
      providers: [
         ChangeNotifierProvider<CounterModel>(create: (_) => CounterModel())
      ],
    );
  }

  static T value<T>([BuildContext context]) {
    context ??= Store.context;
    return Provider.of<T>(context);
  }
}

