import 'package:flutter/material.dart';
import 'package:j_bsque/Shared/Constant/constant.dart';

import '../Widget/languages/languages_design.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  static const String routeName = 'LanguagesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Language',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => LanguagesDesign(
          image: ConstantData.languagesModels[index].image,
          title: ConstantData.languagesModels[index].title,
        ),
        itemCount: ConstantData.languagesModels.length,
      ),
    );
  }
}
