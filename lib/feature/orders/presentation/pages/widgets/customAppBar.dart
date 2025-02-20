// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extentions/sizes_utils_extensions.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: 10.all,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child:
                Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          ),
        ),
      ),
      title: Text(title),
      centerTitle: true,
    );
  }
}
