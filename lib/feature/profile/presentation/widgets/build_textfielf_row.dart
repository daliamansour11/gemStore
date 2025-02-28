import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTextFieldRow(
    String label1, String value1, String label2, String value2) {
  return Row(
    children: [
      Expanded(child: buildTextField(label1, value1)),
      SizedBox(width: 15.w),
      Expanded(child: buildTextField(label2, value2)),
    ],
  );
}

// second function
Widget buildTextField(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      TextFormField(
        initialValue: value,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
      ),
    ],
  );
}
