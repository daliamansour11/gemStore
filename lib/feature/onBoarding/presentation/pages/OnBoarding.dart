import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widget/Custom_button.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/utils/bottom_navigation.dart';
import '../widgets/CustomIndicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  // TODO: Create a model, generate a list of model data, and use it here.
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

  final List<Map<String, String>> onboardingPages = [
    {
      'title': 'Discover something new',
      'subtitle': 'Special new arrivals just for you',
      'image': 'assets/images/onboarding1.png'
    },
    {
      'title': 'Update trendy outfit',
      'subtitle': 'Favorite brands and hottest trends',
      'image': 'assets/images/onboarding2.png'
    },
    {
      'title': 'Explore your true style',
      'subtitle': 'Relax and let us bring the style to you',
      'image': 'assets/images/onboarding3.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    double defaultSize = orientation == Orientation.landscape
        ? screenHeight * .024
        : screenWidth * .024;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.55, 0.45],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
            child: CarouselSlider(
              items: onboardingPages.map((page) {
                return Column(
                  children: [
                    Text(
                      page['title']!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: defaultSize * 1),
                    Text(
                      page['subtitle']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: defaultSize * 3),
                    Image.asset(page['image']!),
                  ],
                );
              }).toList(),
              options: CarouselOptions(
                height: screenHeight * 0.6,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: defaultSize * 20,
            left: 0,
            right: 0,
            child: Customindicator(dotIndex: currentIndex.toDouble()),
          ),
          Positioned(
            bottom: defaultSize * 10,
            left: defaultSize * 8,
            right: defaultSize * 8,
            child: CustomButton(
              text: currentIndex == onboardingPages.length - 1
                  ? 'Get Started'
                  : 'Shopping Now',
              width: 210,
              height: 53,
              onPressed: () {
                if (currentIndex == onboardingPages.length - 1) {
                  context.pushNamed(const BottomNavigation());
                  // Navigate to home screen or login
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
