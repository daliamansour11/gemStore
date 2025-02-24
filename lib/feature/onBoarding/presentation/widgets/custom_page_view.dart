import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'page_view_item.dart';
import '../../data/model/onboarding_data.dart'; // Import your onboardingPages list
import 'custom_indicator.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int _currentIndex = 0;

  @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          SizedBox(height: 90.h),
          CarouselSlider(
            items: onboardingPages.map((item) {
              return PageViewItem(
                title: item.title,
                subTitle: item.subtitle,
                imagePath: item.imagePath,
              );
            }).toList(),
            options: CarouselOptions(
              height: 0.60.sh,
              autoPlay: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              aspectRatio: 16/9,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 0.75,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
          ),
          SizedBox(height: 15.h),
          PageIndicator(currentIndex: _currentIndex, itemCount: onboardingPages.length),
        ],
      );
    }

  }

