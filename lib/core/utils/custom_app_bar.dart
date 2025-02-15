import 'package:flutter/material.dart';

PreferredSizeWidget? customAppBar({
  required String title,
  Widget? leading,
  bool centerTitle = true,
  bool automaticallyImplyLeading = true,
}) {
  return AppBar(
    title: Text(title),
    leading: leading,
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
  );
}