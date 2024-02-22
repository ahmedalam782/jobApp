import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';

class FilesUploadList extends StatelessWidget {
  const FilesUploadList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.borderTextForm,
        ),
      ),
      child: Row(
        children: [
          Image.asset(AppImageAssets.pdfImage),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                'UI/UX Designer',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 14,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'CV.pdf 300KB',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 12,
                    ),
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(AppImageAssets.edit2Image),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(AppImageAssets.closeCircleImage),
          ),
        ],
      ),
    );
  }
}
