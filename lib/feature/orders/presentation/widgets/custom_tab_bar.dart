import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';

class CustomOrdersTabBar extends StatelessWidget {
  const CustomOrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: ColorsManger.transparent,
      padding: 15.ph + 8.pv,
      labelPadding: 8.ph,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      indicator: const BoxDecoration(color: ColorsManger.transparent),
      overlayColor: MaterialStateProperty.all(ColorsManger.transparent),
      tabs: [
        _buildTab(context, AppString.pending, 0),
        _buildTab(context, AppString.delivered, 1),
        _buildTab(context, AppString.cancelled, 2),
      ],
    );
  }

  Widget _buildTab(BuildContext context, String title, int index) {
    return Tab(
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          var isSelected = tabController.index == index;
          return Container(
            padding: 8.pv + 20.ph,
            decoration: BoxDecoration(
              color: isSelected ? ColorsManger.darkGrey : ColorsManger.transparent,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? ColorsManger.white : ColorsManger.black,
                fontSize: 13.sp,
              ),
            ),
          );
        },
      ),
    );
  }
}
