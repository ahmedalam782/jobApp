import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';
import '../../../Shared/Style/Image/image_assets.dart';
import '../../Screens/notification_Screen.dart';
import '../App_head_title.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: AppHeaderTitle(
              headerTitle: 'Hi, $userName 👋',
              subTitle: 'Create a better future for yourself here'),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: AppColor.borderTextForm,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColor.backgroundContainer,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, NotificationScreen.routeName),
                  child: Image.asset(AppImageAssets.notificationImage),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
