import '../Shared/Constant/constant.dart';

class ErrorServerModel {
  final bool status;
  final String? errorMessage;
  final Map<String, dynamic>? error;

  ErrorServerModel({this.error, required this.status, this.errorMessage});

  factory ErrorServerModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorServerModel(
      status: jsonData[APIConstantData.status],
      errorMessage: ConstantData.isLogin
          ? jsonData[APIConstantData.errorLoginMessage]
          : null,
      error: ConstantData.isLogin
          ? null
          : jsonData[APIConstantData.errorRegisterMessage],
    );
  }
}
