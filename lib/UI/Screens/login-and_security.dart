import 'package:flutter/material.dart';

import '../../Shared/Constant/constant.dart';
import '../Widget/container_header_app.dart';
import '../Widget/profile/content_list_view.dart';

class LoginAndSecurity extends StatelessWidget {
  const LoginAndSecurity({super.key});

  static const String routeName = 'LoginAndSecurity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login and security',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
      ),
      body: Column(
        children: [
          const ContainerHeaderApp(
            title: 'Accont access',
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ContentListView(
                title: ConstantData.accountAccess[index].title,
                routeName: ConstantData.accountAccess[index].routeName,
                icon: Row(
                  children: [
                    Text(
                      ConstantData.accountAccess[index].text,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 14,
                              ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                    ),
                  ],
                )),
            itemCount: ConstantData.accountAccess.length,
          ),
        ],
      ),
    );
  }
}
