import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../data/model/category_data.dart';
class CategorySection extends StatefulWidget {
  const CategorySection({super.key});
  @override
  _CategorySectionState createState() => _CategorySectionState();
}
class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: 306.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    width: 38.w,
                    height: 36.w,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? ColorsManger.brown : ColorsManger
                          .categoryColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        categories[index].icon,
                        width: 17.w,
                        height: 16.11.w,
                        color: isSelected ? ColorsManger.white : ColorsManger
                            .iconColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  FittedBox(
                    child: Text(
                      categories[index].label,
                      style: TextStyle(
                        fontSize: 10,
                        color: isSelected ? ColorsManger.brown : ColorsManger
                            .iconColor,
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
  }
}
