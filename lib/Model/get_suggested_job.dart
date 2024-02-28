import '../Shared/Constant/constant.dart';

class GetSuggestedJobModel {
  final Map<String, dynamic> data;
  final bool status;

  GetSuggestedJobModel({required this.data, required this.status});

  factory GetSuggestedJobModel.fromJson(Map<String, dynamic> jsonData) {
    return GetSuggestedJobModel(
        data: jsonData[APIConstantData.data],
        status: jsonData[APIConstantData.status]);
  }
}
