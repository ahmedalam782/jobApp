import 'package:flutter/material.dart';
import 'package:j_bsque/Shared/Style/Image/image_assets.dart';

import '../App_head_title.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

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
                    'Saved',
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImageAssets.savedIlustrationImage),
                const SizedBox(
                  height: 10,
                ),
                const AppHeaderTitle(
                  headerTitle: 'Nothing has been saved yet',
                  fontSizeHeaderTitle: 24,
                  subTitle: 'Press the star icon on the job you want to save.',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
