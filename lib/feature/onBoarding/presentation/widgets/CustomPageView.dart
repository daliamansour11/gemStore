import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'PageViewItem.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int _currentIndex = 0;
  // TODO: Create a model, generate a list of model data, and use it here.
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

  final List<Map<String, String>> onboardingData = [
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
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            items: onboardingData.map((data) {
              return Pageviewitem(
                Title: data['title']!,
                SubTitle: data['subtitle']!,
                ImagePath: data['image']!,
              );
            }).toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 1,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.3,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(onboardingData.length, (index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
