import 'package:flutter/material.dart';
import 'package:j_bsque/Shared/Style/Color/color.dart';

import '../Widget/App_head_title.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  static const String routeName = 'TermsConditions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Terms & Conditions',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeaderTitle(
                headerTitle: '\nLorem ipsum dolor',
                subTitle: 'Lorem ipsum dolor sit amet, '
                    'consectetur adipiscing elit. '
                    'Nam vel augue sit amet est molestie viverra.'
                    ' Nunc quis bibendum orci. Donec feugiat massa mi, '
                    'at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet,'
                    ' consectetur adipiscing elit.'
                    ' Nam vel augue sit amet est molestie viverra.'
                    ' Nunc quis bibendum orci. Donec feugiat massa mi,'
                    ' at hendrerit mauris rutrum at.'
                    ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Nam vel augue sit amet est molestie viverra.'
                    ' Nunc quis bibendum orci. Donec feugiat massa mi, '
                    'at hendrerit mauris rutrum at. '),
            const SizedBox(
              height: 15,
            ),
            const AppHeaderTitle(
              headerTitle: 'Lorem ipsum dolor\n',
              subTitle: 'Nunc quis bibendum orci. '
                  'Donec feugiat massa mi,'
                  'at hendrerit mauris rutrum at.'
                  ' Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit. ',
            ),
            Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(14),
              alignment: Alignment.center,
              height: 144,
              decoration: const BoxDecoration(
                color: AppColor.borderTextForm,
              ),
              child: Text(
                'Nunc quis bibendum orci. Donec feugiat massa mi,'
                ' at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet,'
                ' consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. '
                'Nunc quis bibendum orci. Donec feugiat massa mi,'
                'at hendrerit mauris rutrum at. ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                ' Nam vel augue sit amet est molestie viverra.'
                ' Nunc quis bibendum orci. Donec feugiat massa mi,'
                ' at hendrerit mauris rutrum at. ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
