import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manger.dart';
import '../resources/colors_manger.dart';

PreferredSizeWidget? customAppBar({
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
                SvgPicture.asset(ImageAssets.backIcon, width: 32, height: 32),
          )
        : IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
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
                SvgPicture.asset(ImageAssets.backIcon, width: 32, height: 32),
          )
        : IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
  );
}
