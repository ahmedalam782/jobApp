import '../Shared/Constant/constant.dart';

class LoginModel {
  final Map<String, dynamic> user;
  final String token;

  LoginModel({required this.user, required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      user: jsonData[APIConstantData.user],
      token: jsonData[APIConstantData.token],
    );
  }
}
