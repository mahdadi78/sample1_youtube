import 'package:flutter/material.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_banner.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/home_page_drawer.dart';
import 'package:sample1_youtube/Ui/pages/home_page/home_page_helper/marquee.dart';
import 'package:sample1_youtube/Ui/ui_helper/actions_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var primareColor = Theme.of(context).primaryColor;
    PageController controller = PageController(initialPage: 2);
    return Scaffold(
        drawer: const HomePageDrawer(),
        appBar: AppBar(
          backgroundColor: primareColor,
          elevation: 0.0,
          actions: const [ActionThemeAndLangChangerButtons()],
          leading: leading(),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              HomePageBanner(controller: controller),
              const Marquee1(),
            ],
          ),
        ));
  }

  Widget leading() {
    return Builder(
      builder: (context) => IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).unselectedWidgetColor,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }
}
