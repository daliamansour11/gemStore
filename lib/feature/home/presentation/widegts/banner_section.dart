import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.02),
      child: Stack(
        children: [
          // Background Image
          Container(
            width: screenWidth,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage(
                    // TODO: Use the App Assets file and the Screen Size Utils package as the main tool for handling responsiveness, following your team's approach....
                    'assets/images/banner.png'), // Ensure the image exists
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned Text
          Positioned(
            top: screenHeight * 0.03, // Adjust position
            right: screenWidth * 0.01, // Adjust position
            child: SizedBox(
              width: screenWidth * 0.4,
              height: screenHeight * 0.1,
              child: Text(
                'Autumn Collection\n2021',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
