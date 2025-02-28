import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_store/feature/profile/presentation/widgets/toggel_option.dart';
import '../../../../core/resources/colors_manger.dart';

class LightDarkToggle extends StatefulWidget {
  const LightDarkToggle({super.key});

  @override
  _LightDarkToggleState createState() => _LightDarkToggleState();
}

class _LightDarkToggleState extends State<LightDarkToggle> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 227.w,
      height: 37.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isLightMode ? 5 : 114,
            top: 3.h,
            child: Container(
              width: 107.5.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: ColorsManger.white,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: const [
                  BoxShadow(
                    color: ColorsManger.black,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ToggleOptionWidget(
                icon: Icons.wb_sunny,
                text: 'Light',
                isLight: true,
                onToggle: (isLight) {
                  setState(() {
                    isLightMode = isLight;
                  });
                },
              ),
              ToggleOptionWidget(
                icon: Icons.wb_sunny,
                text: 'Dark',
                isLight: false,
                onToggle: (isLight) {
                  setState(() {
                    isLightMode = isLight;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
