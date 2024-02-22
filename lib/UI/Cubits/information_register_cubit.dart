import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/Constant/constant.dart';
import 'package:j_bsque/Shared/Exceptions/server_exceptions.dart';
import 'package:j_bsque/Shared/network/remote/API/api_consumer.dart';

import '../States/information_register_state.dart';

class InformationRegisterCubit extends Cubit<InformationRegisterState> {
  InformationRegisterCubit({required this.api})
      : super(InformationRegisterInitialState());
  late APIConsumer api;

  static InformationRegisterCubit get(context) => BlocProvider.of(context);
  bool isClicked = false;
  late int currentIndex;

  Map<int, bool> isSelected = {};
  Map<int, String> storeData = {};

  void selectInterestedWork(int index) {
    currentIndex = index;
    isClicked = !isClicked;
    if (currentIndex == index && isClicked == true) {
      isSelected.addAll({currentIndex: isClicked});
      storeData.addAll({
        currentIndex: ConstantData.interestedRegisterList[currentIndex].title
      });
    } else if (currentIndex == index && isClicked == false) {
      isSelected.remove(currentIndex);
      storeData.remove(currentIndex);
    }
    emit(InformationRegisterInterestedWorkState());
  }

  void selectCountryList(int index) {
    currentIndex = index;
    isClicked = !isClicked;
    if (currentIndex == index && isClicked == true) {
      isSelected.addAll({currentIndex: isClicked});
      storeData.addAll(
          {currentIndex: ConstantData.countryRegisterList[currentIndex].title});
    } else if (currentIndex == index && isClicked == false) {
      isSelected.remove(currentIndex);
      storeData.remove(currentIndex);
    }
    print(storeData);
    emit(InformationRegisterCountryListState());
  }

  void registerProfileInterestedWork() {
    try {
      emit(InformationRegisterInterestedWorkLoadingState());
      if (storeData.isNotEmpty) {
        List<String> interestedWork = [];
        interestedWork.addAll(storeData.values);
        ConstantData.interestedWork = interestedWork.join(',');
        print(ConstantData.interestedWork);
        emit(InformationRegisterInterestedWorkSuccessState());
      } else {
        emit(InformationRegisterInterestedWorkErrorState(''));
      }
    } catch (error) {
      emit(InformationRegisterInterestedWorkErrorState(error.toString()));
    }
  }

  Future registerInformationProfile() async {
    if (storeData.isNotEmpty) {
      List<String> countryRemote = [];
      countryRemote.addAll(storeData.values);
      ConstantData.addressLocation = countryRemote.join(',');
      print(ConstantData.addressLocation);
      try {
        emit(InformationRegisterLoadingState());
        await api.putData(
          APIConstantData.editProfile,
          queryParameters: {
            APIConstantData.address: ConstantData.addressLocation,
            APIConstantData.interestedWork: ConstantData.interestedWork,
            APIConstantData.remotePlace: ConstantData.isRemote,
            APIConstantData.offlinePlace: !ConstantData.isRemote,
          },
        );
        emit(InformationRegisterSuccessState());
      } on ServerExceptions catch (error) {
        emit(InformationRegisterErrorState(
            error.errorServerModel.errorMessage!));
      }
    }
  }
}
