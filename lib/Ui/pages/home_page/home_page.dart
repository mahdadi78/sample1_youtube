import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_banner.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_drawer.dart';
import 'package:sample1_youtube/Ui/ui_helper/actions_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var primareColor = Theme.of(context).primaryColor;
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
        drawer: const HomePageDrawer(),
        appBar: AppBar(
          backgroundColor: primareColor,
          elevation: 0.0,
          actions: const [ActionThemeAndLangChangerButtons()],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColorLight,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              HomePageBanner(controller: controller),
            ],
          ),
        ));
  }
}
