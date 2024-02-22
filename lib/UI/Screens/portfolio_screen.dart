import 'package:flutter/material.dart';

import '../Widget/portfolio/file_upload_list.dart';
import '../Widget/portfolio/upload_file_design.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  static const String routeName = 'PortfolioScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Text(
              'Add portfolio here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 20),
            ),
          ),
          const UploadFileDesign(),
          const FilesUploadList(),
        ],
      ),
    );
  }
}
