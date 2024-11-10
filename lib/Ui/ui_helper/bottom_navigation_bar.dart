import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  PageController controller;
  BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: Theme.of(context).primaryColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      controller.animateToPage(0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: Icon(
                      Icons.home,
                      color: Theme.of(context).unselectedWidgetColor,
                    )),
                IconButton(
                    onPressed: () {
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Theme.of(context).unselectedWidgetColor,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).unselectedWidgetColor,
                    )),
                IconButton(
                    onPressed: () {
                      controller.animateToPage(3,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: Icon(
                      Icons.message_sharp,
                      color: Theme.of(context).unselectedWidgetColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
