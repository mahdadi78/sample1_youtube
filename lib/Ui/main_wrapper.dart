import 'package:flutter/material.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page.dart';
import 'package:sample1_youtube/Ui/pages/massege_page.dart';
import 'package:sample1_youtube/Ui/pages/profile_page.dart';
import 'package:sample1_youtube/Ui/pages/setting_page.dart';
import 'package:sample1_youtube/Ui/ui_helper/bottom_navigation_bar.dart';

class MainWraper extends StatefulWidget {
  const MainWraper({super.key});

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(
          Icons.pause_sharp,
          color: Theme.of(context).unselectedWidgetColor,
        ),
      ),
      bottomNavigationBar: BottomNav(
        controller: pageController,
      ),
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          SettingPage(),
          ProfilePage(),
          MassagePage(),
        ],
      ),
    );
  }
}
