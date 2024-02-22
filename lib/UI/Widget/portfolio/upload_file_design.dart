import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../Shared/Components/button_components.dart';
import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';

class UploadFileDesign extends StatelessWidget {
  const UploadFileDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [8, 8],
      strokeWidth: 1.5,
      color: AppColor.primaryColor,
      radius: const Radius.circular(8),
      borderPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        height: 223,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AppColor.backgroundPortfolio,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(AppImageAssets.documentUploadImage),
            ),
            Text(
              'Upload your other file',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Max. file size 10 MB',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 12),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ButtonComponents(
                onPressed: () {},
                buttonText: 'Add file',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(AppImageAssets.exportImage),
                ),
                backgroundColor: AppColor.backgroundPortfolio,
                textColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
