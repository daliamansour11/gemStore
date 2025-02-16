import 'package:flutter/material.dart';

class NewCollectionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double bannerWidth = screenWidth * 0.9; // 90% of screen width
    double bannerHeight = bannerWidth * (157 / 424); // Maintain aspect ratio
    double imageSize = bannerHeight * 0.85; // Scale image proportionally

    return Container(
      width: bannerWidth,
      height: bannerHeight,
      margin: EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8FA), // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: bannerWidth * 0.05, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "| NEW COLLECTION",
                  style: TextStyle(fontSize: bannerHeight * 0.12, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  "HANG OUT\n& PARTY",
                  style: TextStyle(
                    fontSize: bannerHeight * 0.18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Right Side: Image with Circular Background
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/newcollection.png', // Replace with actual image path
              width: imageSize * 1.2,
              height: imageSize * 1.2,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
