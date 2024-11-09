import 'package:flutter/material.dart';
import 'package:sample1_youtube/Ui/pages/home_page.dart';

class BottomNav extends StatelessWidget {
  PageController controller;
  BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: Colors.grey,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      controller.animateToPage(0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: const Icon(Icons.home)),
                IconButton(
                    onPressed: () {
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: const Icon(Icons.settings)),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: const Icon(Icons.person)),
                IconButton(
                    onPressed: () {
                      controller.animateToPage(3,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut);
                    },
                    icon: const Icon(Icons.message_sharp)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
