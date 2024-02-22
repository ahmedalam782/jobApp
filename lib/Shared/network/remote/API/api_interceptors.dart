import 'package:dio/dio.dart';

import '../../../Constant/constant.dart';
import '../../local/cache_helper.dart';

class APIInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[APIConstantData.authorization] =
        CacheHelper.getData(key: APIConstantData.token) != null
            ? 'Bearer ${CacheHelper.getData(key: APIConstantData.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
