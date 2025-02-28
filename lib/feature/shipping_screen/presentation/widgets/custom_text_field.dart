import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
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
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.pv,
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
                if (asteriskColor != ColorsManger.red) {
                  Future.microtask(() {
                    if (mounted) {
                      setState(() => asteriskColor = ColorsManger.red);
                    }
                  });
                }
                return 'Field is required';
              }
              if (asteriskColor != ColorsManger.green) {
                Future.microtask(() {
                  if (mounted) {
                    setState(() => asteriskColor = ColorsManger.green);
                  }
                });
              }
              return null;
            },
            onChanged: (value) {
              final bool isValid = !(widget.isRequired && value.isEmpty);
              final Color newColor = isValid ? ColorsManger.green : ColorsManger.red;
              
              if (asteriskColor != newColor) {
                setState(() => asteriskColor = newColor);
              }
            },
          ),
        ],
      ),
    );
  }
}