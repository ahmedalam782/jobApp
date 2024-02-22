import 'package:flutter/material.dart';

import '../../../Shared/Style/Color/color.dart';

class RowContainerList extends StatelessWidget {
  const RowContainerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColor.backgroundContainer,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Applied',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '46',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 24),
                )
              ],
            ),
            const VerticalDivider(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Reviewed',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '23',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 24),
                )
              ],
            ),
            const VerticalDivider(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Contacted',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '16',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 24),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
