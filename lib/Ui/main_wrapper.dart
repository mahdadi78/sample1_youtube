import 'package:flutter/material.dart';
import 'package:sample1_youtube/Ui/pages/home_page.dart';
import 'package:sample1_youtube/Ui/pages/massege_page.dart';
import 'package:sample1_youtube/Ui/pages/profile_page.dart';
import 'package:sample1_youtube/Ui/pages/setting_page.dart';
import 'package:sample1_youtube/Ui/ui_helper/actions_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        backgroundColor: Colors.grey,
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.pause_sharp,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNav(
        controller: pageController,
      ),
      appBar: AppBar(
        elevation: 5.0,
        title: Text(AppLocalizations.of(context)!.appName),
        actions: const [ThemeAndLangChanger()],
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
