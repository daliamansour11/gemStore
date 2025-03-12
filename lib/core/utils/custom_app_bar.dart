import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manger.dart';
import '../resources/colors_manger.dart';
import '../widget/svg_displayer.dart';

import '../resources/values_manger.dart';


PreferredSizeWidget? customAppBar({
  required String title,
   required bool haveActions,
  bool centerTitle = true,
  bool automaticallyImplyLeading = true,
 required bool isBackable,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: ColorsManger.white,
    title: Text(title, style:const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),),
    leading: isBackable
        ? InkWell(
            onTap: () => Navigator.pop(context),
            child:
                SvgDisplayer(assetName: ImageAssets.backIcon, width: 32.w, height: 32.h),
          )
        : InkWell(
        onTap: (){
          Scaffold.of(context).openDrawer();
        },
        child: Image.asset(ImageAssets.menuIcon,width: AppSize.s18,height: AppSize.s17,)),

    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
    actions: [
      haveActions? Padding(
        padding:const EdgeInsets.only(right: AppPadding.p32),
        child: InkWell(
          onTap: (){

          },
          child:const ImageIcon(
            AssetImage(ImageAssets.notificationIcon),
            size: AppSize.s24,
          ),
        ),
      ):const SizedBox(),
    ],
  );
}

Widget customAppBarWidget({
  required String title,
  bool centerTitle = true,
  bool automaticallyImplyLeading = true,
  bool isBackable = true,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: ColorsManger.white,
    title: Text(title),
    leading: isBackable
        ? InkWell(
            onTap: () => Navigator.pop(context),
            child:
                SvgPicture.asset(ImageAssets.backIcon, width: AppSize.s32, height: AppSize.s32),
          )
        : InkWell(
  onTap: (){
  Scaffold.of(context).openDrawer();
  },
  child:Image.asset(ImageAssets.menuIcon,width:AppSize.s18,height: AppSize.s17,)),
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
  );
}
