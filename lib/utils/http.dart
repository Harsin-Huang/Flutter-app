import 'package:dio/dio.dart'
    show
        Dio,
        DioError,
        Options,
        InterceptorsWrapper,
        RequestOptions,
        LogInterceptor,
        Response;
import 'localStorage.dart' show LocalStorage;

Dio getDio({options, loading}) {
  if (options == null) {
    options = Options(
      headers: {
        'context-type': 'application/json',
      },
    );
  }
  Dio dio = new Dio(); // with default Options

  // dio.options.baseUrl = "http://www.dtworkroom.com/doris/1/2.0.0/";
  dio.options.connectTimeout = 30 * 1000; //5s
  dio.options.receiveTimeout = 30 * 1000;
  dio.options.headers = options.headers;

  // Add request interceptor
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      String token = await LocalStorage.get('githubRespLoginToken');
      if (options.headers['Authorization'] == null && token != null) {
        options.headers['Authorization'] = 'token $token';
      }
      print('=========【发送请求】Start============');
      print("请求地址 ${options.uri}");
      print("请求头 ${options.headers}");
      print("请求参数 ${options.data}");
      print('=========【发送请求】End============');
      return options;
    },
    onResponse: (Response response) async {
      print('=========【请求成功】Start============');
      print("请求地址 ${response.request.uri}");
      print("请求头 ${response.statusCode}");
      print("返回值 ${response.data}");
      print('=========【请求成功】End============');
      return response;
    },
    onError: (DioError e) async {
      print('e.request.uri=======================${e.request}');
      dynamic msg = e.message;
      dynamic code = 0; // 错误码
      dynamic status = e.type; // http请求状态
      if (e.response != null && e.response.data != null) {
        code = 1;
        msg = e.response.data;
        status = e.response.statusCode;
      }
      return dio.reject({'msg': msg, 'code': code, 'status': status});
    },
  ));
  dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志

  return dio;
}

Future<dynamic> get({url, data = const {}, options, loading}) async {
  return getDio(options: options, loading: loading ?? Map()).get(url);
}

Future post({url, data = const {}, options, loading}) async {
  return getDio(options: options, loading: loading ?? Map())
      .post(url, data: data);
}

Future put({url, data = const {}, options, loading}) async {
  return getDio(options: options, loading: loading ?? Map())
      .put(url, data: data);
}

