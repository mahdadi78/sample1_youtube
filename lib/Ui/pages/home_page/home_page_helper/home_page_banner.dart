import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Stack(
            children: [
              PageView(
                controller: controller,
                children: [
                  cardImage('assets/1.png'),
                  cardImage('assets/3.png'),
                  cardImage('assets/4.png'),
                  cardImage('assets/2.png'),
                ],
              ),
              smoothPageIndicator(context),
            ],
          )),
    );
  }

  Widget smoothPageIndicator(context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: 4,
            effect: ExpandingDotsEffect(
              dotColor: Theme.of(context).scaffoldBackgroundColor,
              spacing: 8,
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Theme.of(context).primaryColor,
            ), // your preferred effect
            onDotClicked: (index) => controller.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn),
          ),
        ));
  }

  Widget cardImage(String adres) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(adres),
      ),
    );
  }
}
