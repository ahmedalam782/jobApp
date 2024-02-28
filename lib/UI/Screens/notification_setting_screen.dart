import 'package:flutter/material.dart';
import 'package:j_bsque/Shared/Constant/constant.dart';
import 'package:j_bsque/Shared/Style/Color/color.dart';

import '../Widget/container_header_app.dart';
import '../Widget/profile/content_list_view.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  static const String routeName = 'NotificationSettingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notification',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const ContainerHeaderApp(
              title: 'Job notification',
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ContentListView(
                title: ConstantData.jobNotification[index].title,
                icon: Switch(
                  thumbColor: MaterialStateProperty.all(
                    AppColor.textButtonColorClicked,
                  ),
                  trackOutlineColor: MaterialStateProperty.all(
                    AppColor.borderTextForm,
                  ),
                  inactiveTrackColor: AppColor.borderTextForm,
                  activeTrackColor: Theme.of(context).primaryColor,
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              itemCount: ConstantData.jobNotification.length,
            ),
            const SizedBox(
              height: 20,
            ),
            const ContainerHeaderApp(
              title: 'Other notification',
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ContentListView(
                title: ConstantData.otherNotification[index].title,
                icon: Switch(
                  thumbColor: MaterialStateProperty.all(
                    AppColor.textButtonColorClicked,
                  ),
                  trackOutlineColor: MaterialStateProperty.all(
                    AppColor.borderTextForm,
                  ),
                  inactiveTrackColor: AppColor.borderTextForm,
                  activeTrackColor: Theme.of(context).primaryColor,
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              itemCount: ConstantData.otherNotification.length,
            ),
          ],
        ),
      ),
    );
  }
}
