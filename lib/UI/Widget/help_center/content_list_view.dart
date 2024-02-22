import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';

class ContentListViewHelpCenter extends StatelessWidget {
  const ContentListViewHelpCenter({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.backgroundContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Lorem ipsum dolor sit amet',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: Image.asset(AppImageAssets.arrowDownImage),
            ),
          ],
        ),
      ),
    );
  }
}
