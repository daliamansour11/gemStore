import 'package:flutter/material.dart';

class Pageviewitem extends StatelessWidget {
  String Title;
  String SubTitle;
  String ImagePath;
  Pageviewitem(
      {required this.Title, required this.SubTitle, required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    double defaultSize = orientation == Orientation.landscape
        ? screenHeight * .024
        : screenWidth * .024;
    return Column(children: [
      SizedBox(
        height: defaultSize * 10,
      ),
      Text(
        Title,
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: defaultSize * 1,
      ),
      Text(
        SubTitle,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: defaultSize * 3,
      ),
      Image.asset(ImagePath),
    ]);
  }
}
