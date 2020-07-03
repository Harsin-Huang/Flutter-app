import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutterapp/page/home/index.dart' show MainAPP;
import 'package:flutterapp/page/details.dart' show DetailsPage;

// 首页
Handler homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MainAPP();
  },
);

// 详情页
Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String detailsId = params['id'].first;
      return DetailsPage(
      detailsId: int.parse('$detailsId')
    );
  },
);