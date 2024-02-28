import 'package:flutter/material.dart';

import '../../../Shared/Components/text_form_components.dart';
import '../../../Shared/Style/Image/image_assets.dart';
import '../App_head_title.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back,
                ),
                Center(
                  child: Text(
                    'Messages',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                const Text(''),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormComponents(
                  hintText: 'Search....',
                  prefixIcon: ImageIcon(
                    AssetImage(
                      AppImageAssets.searchImage,
                    ),
                  ),
                  radius: 100,
                  maxHeight: 48,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  AppImageAssets.filterImage,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImageAssets.dataIlustrationImage),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppHeaderTitle(
                    headerTitle: 'You have not received any messages',
                    subTitle:
                        'Once your application has reached the interview stage, you will get a message from the recruiter.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
