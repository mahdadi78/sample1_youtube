import 'package:flutter/material.dart';
import 'package:provider_base_tools/provider_base_tools.dart';
import 'package:sample1_youtube/Provider/theme_provider.dart';
import 'package:sample1_youtube/Ui/pages/home_page.dart';
import 'package:sample1_youtube/Ui/pages/profile_page.dart';
import 'package:sample1_youtube/Ui/pages/setting_page.dart';
import 'package:sample1_youtube/Ui/ui_helper/actions_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainWraper extends StatefulWidget {
  const MainWraper({super.key});

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text(AppLocalizations.of(context)!.appName),
          actions: const [ThemeAndLangChanger()],
        ),
        body: PageView(
          controller: _pageController,
          children: const [HomePage(), ProfilePage(), SettingPage()],
        ));
  }
}
