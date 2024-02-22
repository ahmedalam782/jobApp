import '../Shared/Constant/constant.dart';

class GetProfileData {
  final Map<String, dynamic> data;
  final bool status;

  GetProfileData({required this.status, required this.data});

  factory GetProfileData.fromJson(Map<String, dynamic> jsonData) {
    return GetProfileData(
        data: jsonData[APIConstantData.data],
        status: jsonData[APIConstantData.status]);
  }
}
