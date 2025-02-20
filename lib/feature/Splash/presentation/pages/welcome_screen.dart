import 'package:flutter/material.dart';
import '../../../../core/widget/Custom_button.dart';

import '../../../onBoarding/presentation/pages/OnBoarding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Rectangle.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Title
                Text(
                  'Welcome to GemStore!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01), // Adjusted spacing
                // Subtitle
                Text(
                  'The home for a fashionista',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Adjust spacing
                // Button with exact position & size
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                      text: 'Get Started',
                      width: 193,
                      height: 53,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Onboarding()),
                        );
                      }),
                ),
                SizedBox(height: screenHeight * 0.08), // Adjust spacing
              ],
            ),
          ),
        ],
      ),
    );
  }
}
