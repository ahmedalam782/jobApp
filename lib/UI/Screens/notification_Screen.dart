import 'package:flutter/material.dart';

import '../../Shared/Style/Image/image_assets.dart';
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const ContainerHeaderApp(
            title: 'New',
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Image.asset(
                  AppImageAssets.facebookImage,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Facebook',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: 14),
                          ),
                          Spacer(),
                          Image.asset(
                            AppImageAssets.ellipseImage,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '10.00AM',
                          ),
                        ],
                      ),
                      Text(
                        'Posted new design jobs',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Image.asset(
                  AppImageAssets.facebookImage,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Facebook',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: 14),
                          ),
                          Spacer(),
                          Image.asset(
                            AppImageAssets.ellipseImage,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '10.00AM',
                          ),
                        ],
                      ),
                      Text(
                        'Posted new design jobs',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ContainerHeaderApp(
            title: 'Yesterday',
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Image.asset(
                  AppImageAssets.emailImage,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Email setup successful',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: 14),
                          ),
                          Spacer(),
                          Image.asset(
                            AppImageAssets.ellipseImage,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '10.00AM',
                          ),
                        ],
                      ),
                      Text(
                        'Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Image.asset(
                  AppImageAssets.jobsqueLogoImage,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Welcome to Jobsque',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: 14),
                          ),
                          Spacer(),
                          Image.asset(
                            AppImageAssets.ellipseImage,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '10.00AM',
                          ),
                        ],
                      ),
                      Text(
                        'Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(AppImageAssets.notificationIlustrationImage),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 30.0),
          //         child: AppHeaderTitle(
          //           headerTitle: 'No new notifications yet',
          //           subTitle:
          //           'You will receive a notification if there is something on your account',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
