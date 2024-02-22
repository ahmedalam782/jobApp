abstract class APIConsumer {
  Future<dynamic> getData(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> postData(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> putData(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });

  Future<dynamic> deleteData(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
