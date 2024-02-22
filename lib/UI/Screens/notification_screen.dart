import 'package:flutter/material.dart';

import '../Widget/container_header_app.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const String routeName = 'NotificationScreen';

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
      body: const Column(
        children: [
          ContainerHeaderApp(
            title: 'Job notification',
          ),
          // ContentListView(
          //   title: 'Your Job Search Alert',
          //   icon: Switch(
          //     activeThumbImage: AssetImage(
          //       'assets/images/dark_mode.png',
          //     ),
          //     // thumbColor: MaterialStateProperty.all(
          //     //   //Theme.of(context).dividerTheme.color,
          //     // ),
          //     inactiveThumbImage: AssetImage(
          //       'assets/images/light_mode.png',
          //     ), value: true,
          //     // inactiveTrackColor: Theme.of(context).dividerTheme.color,
          //     // activeTrackColor: Theme.of(context).dividerTheme.color,
          //     // value: cubit.isDark,
          //   //   onChanged: (value) => cubit.changeAppMode(),
          //   // ),
          // ),
        ],
      ),
    );
  }
}
