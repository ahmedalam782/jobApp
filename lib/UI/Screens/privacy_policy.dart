import 'package:flutter/material.dart';
import 'package:j_bsque/UI/Widget/App_head_title.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  static const String routeName = 'PrivacyPolicy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Privacy Policy ',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AppHeaderTitle(
              headerTitle: '\nYour privacy is important',
              subTitle: '\nLorem ipsum dolor sit amet,'
                  ' consectetur adipiscing elit.'
                  ' Nam vel augue sit amet est molestie viverra. '
                  'Nunc quis bibendum orci. Donec feugiat massa mi, '
                  'at hendrerit mauris rutrum at. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                  ' Nam vel augue sit amet est molestie viverra. '
                  'Nunc quis bibendum orci. Donec feugiat massa mi, '
                  'at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit. Nam vel augue sit amet est molestie '
                  'viverra. Nunc quis bibendum orci. Donec feugiat massa mi, '
                  'at hendrerit mauris rutrum at. \n '
                  '\n'
                  ' Nam vel augue sit amet est molestie'
                  ' viverra. Nunc quis bibendum orci. Donec feugiat massa mi, '
                  'at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit.'
                  ' Nam vel augue sit amet est molestie viverra. '
                  'Nunc quis bibendum orci. Donec feugiat massa mi, '
                  'at hendrerit mauris rutrum at. ',
            ),
            SizedBox(
              height: 15,
            ),
            AppHeaderTitle(
              headerTitle: 'Data controllers and contract partners\n',
              subTitle: 'Lorem ipsum dolor sit amet,'
                  ' consectetur adipiscing elit. '
                  'Nam vel augue sit amet est molestie viverra. '
                  'Nunc quis bibendum orci. Donec feugiat massa mi, '
                  'at hendrerit mauris rutrum at.'
                  ' Lorem ipsum dolor sit amet,'
                  ' consectetur adipiscing elit.'
                  ' Nam vel augue sit amet est molestie viverra. '
                  'Nunc quis bibendum orci. Donec feugiat massa mi, '
                  'at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit. '
                  'Nam vel augue sit amet est molestie viverra.'
                  ' Nunc quis bibendum orci. Donec feugiat massa mi,'
                  ' at hendrerit mauris rutrum at. ',
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
