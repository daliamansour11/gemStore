// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onPressed;
  bool isfill;
  CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.isfill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Color(0xff343434)),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(text,
            style:
                TextStyle(color: !isfill ? Color(0xff343434) : Colors.white)),
      ),
    );
  }
}
