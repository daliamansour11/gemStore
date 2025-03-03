import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/widget/Custom_button.dart';
import '../../../onBoarding/presentation/pages/on_boarding.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: Alignment.center,
      child: CustomButton(
        text: AppString.getStarted,
        width: 193.w,
        height: 53.h,
        color: ColorsManger.btnColor, isFill: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Onboarding(),
            ),
          );
        },
      ),
    );
  }
}
