import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/theme_data.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';


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
            color: ColorsManger.white,
            boxShadow: [kCustomBoxShadow],
          ),
          child:CircleAvatar(
            radius: 20,
            backgroundColor: ColorsManger.white,
            child:
                Icon(Icons.arrow_back_ios_new, color: ColorsManger.black, size: 18.sp),
          ),
        ),
      ),
      title: Text(title,style: appTheme().textTheme.bodyLarge),
      centerTitle: true,
    );
  }
}
