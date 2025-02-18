import 'package:flutter/material.dart';

class LightDarkToggle extends StatefulWidget {
  @override
  _LightDarkToggleState createState() => _LightDarkToggleState();
}

class _LightDarkToggleState extends State<LightDarkToggle> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 227,
      height: 37,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isLightMode ? 5 : 114,
            top: 3,
            child: Container(
              width: 107.5,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildToggleOption(Icons.wb_sunny, "Light", true),
              _buildToggleOption(Icons.nightlight_round, "Dark", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(IconData icon, String text, bool isLight) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isLightMode = isLight;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isLightMode == isLight ? Colors.black : Colors.grey,
              ),
              const SizedBox(width: 7),
              Text(
                text,
                style: TextStyle(
                  color: isLightMode == isLight ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}