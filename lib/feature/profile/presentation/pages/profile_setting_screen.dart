import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/firebase_analytics/firebase_analytic.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../widgets/build_textfielf_row.dart';
import 'profile.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {

    FirebaseAnalytic.logScreenView('ProfileSettingScreen', 'ProfileSettingScreen');

    return Scaffold(
      appBar: customAppBar(title: AppString.profileSettings, context: context,
          isBackable: true, haveActions: false),

      backgroundColor: ColorsManger.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: AppPadding.p20.h),
                  child: Stack(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsManger.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            ImageAssets.onboardingLogo1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 5.w,
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsManger.black,
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: ColorsManger.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              buildTextFieldRow(
                'First Name',
                'Sunie',
                'Last Name',
                'Pham',
              ),
              SizedBox(height: 20.h),
              buildTextField('Email', 'sunieux@gmail.com'),
              SizedBox(height: 20.h),
              buildTextFieldRow('Gender', 'Female', 'Phone', '(+1) 23456789'),
              SizedBox(height: 40.h),
              ElevatedButton(
                onPressed: () {


                  FirebaseAnalytic.buttonClicked('saveChange button_clicked');

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManger.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: AppPadding.p15.w, horizontal: AppPadding.p50.h),
                ),
                child: InkWell(
                  onTap: () {
                    context.pushNamed(const ProfileScreen());
                  },
                  child: const Text(
                    'Save change',
                    style: TextStyle(color: ColorsManger.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
