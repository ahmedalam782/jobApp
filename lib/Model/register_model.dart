import '../Shared/Constant/constant.dart';

class RegisterModel {
  final Map<String, dynamic> data;
  final String token;

  RegisterModel({required this.data, required this.token});

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(
      data: jsonData[APIConstantData.data],
      token: jsonData[APIConstantData.token],
    );
  }
}
