import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';

class ContentListViewHelpCenterWhenPressed extends StatelessWidget {
  const ContentListViewHelpCenterWhenPressed({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.backgroundContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Lorem ipsum dolor sit amet',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 16,
                      ),
                ),
                Spacer(),
                InkWell(
                  onTap: onTap,
                  child: Image.asset(AppImageAssets.arrowDownImage),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet,'
              ' consectetur adipiscing elit.'
              ' Fusce ultricies mi enim, quis vulputate nibh faucibus at. '
              'Maecenas est ante, suscipit vel sem non, blandit blandit erat.'
              ' Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. '
              'Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et.'
              ' Curabitur ac leo sit amet leo interdum mattis vel eu mauris.',
            ),
          ),
        ],
      ),
    );
  }
}
