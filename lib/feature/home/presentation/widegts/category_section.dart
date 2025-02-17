import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {'icon': 'assets/icons/icon4.png', 'label': 'Women'},
    {'icon': 'assets/icons/icon3.png', 'label': 'Men'},
    {'icon': 'assets/icons/icon2.png', 'label': 'Accessories'},
    {'icon': 'assets/icons/icon1.png', 'label': 'Beauty'},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.075; // Icon is 7.5% of screen width
    double circleSize = screenWidth * 0.15; // Circle is 15% of screen width
    double textSize = screenWidth * 0.035; // Dynamic text size

    return SizedBox(
      height: circleSize + 30, // Extra space to prevent overflow
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.only(bottom: 5), // Prevents clipping
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              children: [
                Container(
                  width: circleSize,
                  height: circleSize,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.brown : Colors.grey[200],
                  ),
                  child: Center(
                    child: Image.asset(
                      categories[index]['icon']!,
                      width: iconSize,
                      height: iconSize * 1.6,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                FittedBox(
                  child: Text(
                    categories[index]['label']!,
                    style: TextStyle(
                      fontSize: textSize,
                      color: isSelected ? Colors.brown : Colors.black54,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
