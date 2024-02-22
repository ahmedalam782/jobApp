import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/UI/Cubits/information_register_cubit.dart';
import 'package:j_bsque/UI/States/information_register_state.dart';

import '../../../Shared/Constant/constant.dart';
import '../../../Shared/Style/Color/color.dart';
import 'country_list_design.dart';

class CountryWrapDesign extends StatelessWidget {
  const CountryWrapDesign({super.key});

  @override
  Widget build(BuildContext context) {
    /* return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 16,
        children: [
          CountryListDesign(
            image: ConstantData.countryRegisterList[0].image,
            title: ConstantData.countryRegisterList[0].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[1].image,
            title: ConstantData.countryRegisterList[1].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[2].image,
            title: ConstantData.countryRegisterList[2].title,
            onTap: () {},
          ),
          CountryListDesign(
            image:ConstantData. countryRegisterList[3].image,
            title: ConstantData.countryRegisterList[3].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[4].image,
            title: ConstantData.countryRegisterList[4].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[5].image,
            title: ConstantData.countryRegisterList[5].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[6].image,
            title: ConstantData.countryRegisterList[6].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[7].image,
            title: ConstantData.countryRegisterList[7].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[8].image,
            title: ConstantData.countryRegisterList[8].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[9].image,
            title: ConstantData.countryRegisterList[9].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[10].image,
            title: ConstantData.countryRegisterList[10].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[11].image,
            title: ConstantData.countryRegisterList[11].title,
            onTap: () {},
          ),
          CountryListDesign(
            image: ConstantData.countryRegisterList[12].image,
            title: ConstantData.countryRegisterList[12].title,
            onTap: () {},
          ),
        ],
      ),
    );*/
    return BlocConsumer<InformationRegisterCubit, InformationRegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          InformationRegisterCubit informationRegisterCubit =
              InformationRegisterCubit.get(context);
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 40,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) => CountryListDesign(
                image: ConstantData.countryRegisterList[index].image,
                title: ConstantData.countryRegisterList[index].title,
                onTap: () => informationRegisterCubit.selectCountryList(index),
                backgroundContainer:
                    informationRegisterCubit.isSelected[index] != null
                        ? AppColor.backgroundContainerClicked
                        : AppColor.backgroundContainer,
                borderContainerColor:
                    informationRegisterCubit.isSelected[index] != null
                        ? AppColor.primaryColor
                        : AppColor.borderTextForm),
            itemCount: ConstantData.countryRegisterList.length,
          );
        });
  }
}
