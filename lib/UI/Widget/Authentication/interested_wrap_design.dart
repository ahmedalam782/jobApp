import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/Constant/constant.dart';
import '../../../Shared/Style/Color/color.dart';
import '../../Cubits/information_register_cubit.dart';
import '../../States/information_register_state.dart';
import 'interested_list_design.dart';

class InterestedWrapDesign extends StatelessWidget {
  const InterestedWrapDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InformationRegisterCubit, InformationRegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          InformationRegisterCubit informationRegisterCubit =
              InformationRegisterCubit.get(context);
          /*  return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                InterestedListDesign(
                  image: ConstantData.interestedRegisterList[0].image,
                  title: ConstantData.interestedRegisterList[0].title,
                  onTap:()=>informationRegisterCubit.selectInterestedWork(0),
                  backgroundContainer: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==0?AppColor.backgroundContainerClicked:AppColor.backgroundContainer,
                  borderContainerColor: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==0?AppColor.primaryColor:AppColor.borderTextForm,
                  imageColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==0?AppColor.primaryColor:AppColor.textButtonColor,
                ),
                InterestedListDesign(
                  image: ConstantData.interestedRegisterList[1].image,
                  title: ConstantData.interestedRegisterList[1].title,
                  onTap:()=>informationRegisterCubit.selectInterestedWork(1),
                  backgroundContainer: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==1?AppColor.backgroundContainerClicked:AppColor.backgroundContainer,
                  borderContainerColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==1?AppColor.primaryColor:AppColor.borderTextForm,
                  imageColor: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==1?AppColor.primaryColor:AppColor.textButtonColor,
                ),
                InterestedListDesign(
                  image: ConstantData.interestedRegisterList[2].image,
                  title: ConstantData.interestedRegisterList[2].title,
                  onTap:()=>informationRegisterCubit.selectInterestedWork(2),
                  backgroundContainer: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==2?AppColor.backgroundContainerClicked:AppColor.backgroundContainer,
                  borderContainerColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==2?AppColor.primaryColor:AppColor.borderTextForm,
                  imageColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==2?AppColor.primaryColor:AppColor.textButtonColor,
                ),
                InterestedListDesign(
                  image: ConstantData.interestedRegisterList[3].image,
                  title: ConstantData.interestedRegisterList[3].title,
                  onTap:()=>informationRegisterCubit.selectInterestedWork(3),
                  backgroundContainer: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==3?AppColor.backgroundContainerClicked:AppColor.backgroundContainer,
                  borderContainerColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==3?AppColor.primaryColor:AppColor.borderTextForm,
                  imageColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==3?AppColor.primaryColor:AppColor.textButtonColor,
                ),
                InterestedListDesign(
                  image: ConstantData.interestedRegisterList[4].image,
                  title: ConstantData.interestedRegisterList[4].title,
                  onTap:()=>informationRegisterCubit.selectInterestedWork(4),
                  backgroundContainer: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==4?AppColor.backgroundContainerClicked:AppColor.backgroundContainer,
                  borderContainerColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==4?AppColor.primaryColor:AppColor.borderTextForm,
                  imageColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==4?AppColor.primaryColor:AppColor.textButtonColor,
                ),
                InterestedListDesign(
                  image: ConstantData.interestedRegisterList[5].image,
                  title: ConstantData.interestedRegisterList[5].title,
                  onTap:()=>informationRegisterCubit.selectInterestedWork(5),
                  backgroundContainer: informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==5?AppColor.backgroundContainerClicked:AppColor.backgroundContainer,
                  borderContainerColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==5?AppColor.primaryColor:AppColor.borderTextForm,
                  imageColor:  informationRegisterCubit.isClicked&&informationRegisterCubit.currentIndex==5?AppColor.primaryColor:AppColor.textButtonColor,
                ),
              ],
            ),
          );
*/
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 126,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) => InterestedListDesign(
              image: ConstantData.interestedRegisterList[index].image,
              title: ConstantData.interestedRegisterList[index].title,
              onTap: () => informationRegisterCubit.selectInterestedWork(index),
              backgroundContainer:
                  informationRegisterCubit.isSelected[index] != null
                      ? AppColor.backgroundContainerClicked
                      : AppColor.backgroundContainer,
              borderContainerColor:
                  informationRegisterCubit.isSelected[index] != null
                      ? AppColor.primaryColor
                      : AppColor.borderTextForm,
              imageColor: informationRegisterCubit.isSelected[index] != null
                  ? AppColor.primaryColor
                  : AppColor.textButtonColor,
            ),
            itemCount: ConstantData.interestedRegisterList.length,
          );
        });
  }
}
