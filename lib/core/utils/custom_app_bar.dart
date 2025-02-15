import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manger.dart';

PreferredSizeWidget? customAppBar({
  required String title,
  bool centerTitle = true,
  bool automaticallyImplyLeading = true,
  required BuildContext context,
}) {
  return AppBar(
    title: Text(title),
    leading: InkWell(
      onTap: () => Navigator.pop(context),
      child: SvgPicture.asset(ImageAssets.backIcon, width: 32, height: 32),
    ),
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
  );
}
