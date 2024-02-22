import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_bsque/Shared/Style/Image/image_assets.dart';
import 'package:j_bsque/Shared/network/remote/API/dio_consumer.dart';
import 'package:j_bsque/UI/Cubits/home_cubit.dart';
import 'package:j_bsque/UI/States/home_state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(api: DioConsumer(dio: Dio()))..getProfile(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, HomeStates state) {},
        builder: (BuildContext context, HomeStates state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
/*
            appBar: AppBar(
              backgroundColor: Color(0xffD7E3FF),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xffD7E3FF),
                statusBarIconBrightness: Brightness.light,
              ),
            ),
*/
            // appBar: homeCubit.currentIndex==0?AppBar(
            //   systemOverlayStyle: SystemUiOverlayStyle(
            //     statusBarColor:  Color(0xffD7E3FF),
            //     statusBarIconBrightness: Brightness.light,
            //   ),
            //   leading: Icon(Icons.arrow_back),
            //   title: Center(child: Text('Profile')),
            //   actions: [
            //     Padding(
            //       padding: const EdgeInsets.only(right: 16.0),
            //       child: Image.asset(AppImageAssets.logoutImage),
            //     )
            //   ],
            // ):null,
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeCubit.currentIndex,
              onTap: (index) {
                homeCubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppImageAssets.homeImage),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppImageAssets.messagesImage),
                  ),
                  label: "Messages",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppImageAssets.appliedImage),
                  ),
                  label: "Applied",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppImageAssets.savedImage),
                  ),
                  label: "Saved",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(AppImageAssets.profileImage),
                  ),
                  label: "Profile",
                ),
              ],
            ),
            body: homeCubit.screens[homeCubit.currentIndex],
          );
        },
      ),
    );
  }
}
