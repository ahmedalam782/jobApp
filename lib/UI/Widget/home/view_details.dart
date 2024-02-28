import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 18,
                ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'View all',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 14, color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
