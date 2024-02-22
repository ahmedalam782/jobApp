import '../Shared/Constant/constant.dart';

class ProfileDataModel {
  final Map<String, dynamic> data;
  final bool status;

  ProfileDataModel({required this.data, required this.status});

  factory ProfileDataModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileDataModel(
        data: jsonData[APIConstantData.data],
        status: jsonData[APIConstantData.status]);
  }
}
