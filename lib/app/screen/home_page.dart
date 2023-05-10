import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/controller/local_controller.dart';
import 'package:newsly/app/screen/news_page.dart';
import 'package:newsly/app/utils/app_colors.dart';
import 'package:newsly/app/utils/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final LocalController localController =
      Get.put(LocalController(), tag: "app", permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              AppRoutes.navigateOffLogin();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withAlpha(100),
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                icon: const Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                },
                icon: const Icon(Icons.favorite),
              ),
              label: 'Saved',
            ),
          ],
        ),
        //  const BottomNavBar(index: 0),
        extendBodyBehindAppBar: true,
        body: Container(
          color: AppColors.white,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 2),
            child: [NewsPage(), Container()][index],
          ),
        ));
  }
}
