import 'package:flutter/material.dart';

class ContentListView extends StatelessWidget {
  const ContentListView({
    super.key,
    this.image = const SizedBox(),
    required this.title,
    this.routeName = '',
    this.icon = const Icon(
      Icons.arrow_forward,
      size: 16,
    ),
    this.divider = const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 10,
      ),
      child: Divider(
        thickness: .8,
      ),
    ),
  });

  final Widget image;
  final String title;
  final String routeName;
  final Widget icon;
  final Widget divider;

// final String
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, routeName),
            child: Row(
              children: [
                image,
                const SizedBox(
                  width: 15,
                ),
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                const Spacer(),
                icon,
              ],
            ),
          ),
        ),
        divider,
      ],
    );
  }
}
