import 'package:flutter/material.dart';

class welcome_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/welcome.png'), // Ensure the image path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/Rectangle.png'), // Ensure the image path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Welcome to GemStore!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24, // Matching font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8), // Adjusted spacing
                // Subtitle
                Text(
                  "The home for a fashionista",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 25), // Adjust spacing
                // Button with semi-transparent background and border
                SizedBox(
                  width: 200, // Match button width
                  height: 50, // Match button height
                  child: OutlinedButton(
                    onPressed: () {
                      // Button action
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey
                          .withOpacity(0.5), // Semi-transparent button
                      foregroundColor: Colors.white, // Text color
                      side: BorderSide(
                          color: Colors.white38, width: 1.5), // White border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Fully rounded button
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18, // Adjust text size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60), // Adjust bottom spacing
              ],
            ),
          ),
        ],
      ),
    );
  }
}
