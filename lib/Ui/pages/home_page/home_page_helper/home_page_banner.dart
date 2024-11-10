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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/003/355/917/small_2x/business-banner-design-with-blue-wave-background-free-vector.jpg')),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/003/355/917/small_2x/business-banner-design-with-blue-wave-background-free-vector.jpg')),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/003/355/917/small_2x/business-banner-design-with-blue-wave-background-free-vector.jpg')),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/003/355/917/small_2x/business-banner-design-with-blue-wave-background-free-vector.jpg')),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SmoothPageIndicator(
                      controller: controller, // PageController
                      count: 4,
                      effect: const WormEffect(
                        dotColor: Colors.grey,
                        spacing: 8,
                        type: WormType.thin,
                        dotHeight: 15,
                        dotWidth: 15,
                        activeDotColor: Colors.indigoAccent,
                      ), // your preferred effect
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.bounceIn),
                    ),
                  )),
            ],
          )),
    );
  }
}
