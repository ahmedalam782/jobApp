import 'package:dio/dio.dart';

import '../../../Constant/constant.dart';
import '../../../Exceptions/server_exceptions.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';

/*class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: APIConstantData.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
  }) async {
    return await dio!.post(url, data: data);
  }
}*/

class DioConsumer extends APIConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = APIConstantData.baseUrl;
    dio.options.receiveDataWhenStatusError = true;
    dio.interceptors.add(APIInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  @override
  Future getData(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
      );
      return response.data;
    } on DioException catch (error) {
      handleDioException(error);
    }
  }

  @override
  Future postData(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (error) {
      handleDioException(error);
    }
  }

  @override
  Future putData(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (error) {
      handleDioException(error);
    }
  }

  @override
  Future deleteData(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (error) {
      handleDioException(error);
    }
  }
}
