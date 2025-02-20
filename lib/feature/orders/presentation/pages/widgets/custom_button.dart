// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onPressed;
  bool isfill;
  CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.isfill,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Color(0xff343434)),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(text,
            style:
                TextStyle(color: !isfill ? const Color(0xff343434) : Colors.white)),
      ),
    );
  }
}
