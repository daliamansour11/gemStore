import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isRequired;

  const CustomTextField({
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    super.key,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color asteriskColor = ColorsManger.green;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              label: RichText(
                text: TextSpan(
                  text: widget.label,
                  style: TextStyle(color: ColorsManger.grey, fontSize: 14.sp),
                  children: widget.isRequired
                      ? [
                          TextSpan(
                              text: ' *',
                              style: TextStyle(color: asteriskColor))
                        ]
                      : [],
                ),
              ),
              border: const UnderlineInputBorder(),
              filled: true,
              fillColor: ColorsManger.white,
            ),
            validator: (value) {
              if (widget.isRequired && (value == null || value.isEmpty)) {
                setState(() => asteriskColor = ColorsManger.red);
                return 'Field is required';
              }
              setState(() => asteriskColor = ColorsManger.green);
              return null;
            },
          ),
        ],
      ),
    );
  }
}

