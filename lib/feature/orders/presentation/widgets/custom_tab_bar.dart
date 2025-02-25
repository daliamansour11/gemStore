import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/colors_manger.dart';

class CustomOrdersTabBar extends StatelessWidget {
  const CustomOrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      indicator: const BoxDecoration(color: Colors.transparent),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      tabs: [
        _buildTab(context, 'Pending', 0),
        _buildTab(context, 'Delivered', 1),
        _buildTab(context, 'Cancelled', 2),
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
              color: isSelected ? ColorsManger.darkGrey : Colors.transparent,
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
