import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/global.dart';
import '../../../../core/resources/colors_manger.dart';
import '../widgets/custom_page_view.dart';
import '../widgets/onboarding_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding( {super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    Global.analytics.setCurrentScreen(
      screenName: 'Onboarding',
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          const CustomPageView(),
          const OnBoardingButton(),
        ],
      ),
    );
  }

  Widget _buildBackgroundGradient() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsManger.white, ColorsManger.onboardingColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.55, 0.45],
        ),
      ),
    );
  }
}
