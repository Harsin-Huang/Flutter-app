import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutterapp/page/index.dart' show MainAPP;
import 'package:flutterapp/page/details.dart' show DetailsPage;
import 'package:flutterapp/page/empty.dart' show EmptyPage;

class FluroRouter {
   static Router router;
   static Router initRouter() {
      FluroRouter.router = Router();
      // 空页面
      router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return EmptyPage();
        },
      );
      // 首页
      router.define(
        '/',
        handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) {
            return MainAPP();
          },
        ),
      );
      // 详情页面
      router.define(
        '/details',
        handler: Handler(
          handlerFunc: (BuildContext context, Map<String, List<String>> params) {
            String detailsId = params['id'].first;
             return DetailsPage(
                detailsId: int.parse('$detailsId')
             );
          }
        )
      );

      return router;
  }
}