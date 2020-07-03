import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './route_handlers.dart';
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

      router.define('/', handler: homeHandler);
      router.define('/details',handler: detailsHandler);

      return router;
  }
}