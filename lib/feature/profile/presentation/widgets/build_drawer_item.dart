import 'package:flutter/material.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../Setting/presentation/pages/setting.dart';

Widget buildDrawerItem(BuildContext context,IconData icon, String title , void Function()? onPressed) {
  return ListTile(
    leading: IconButton(
      onPressed: () {
        context.pushNamed(const SettingsPage());

      },
      icon: Icon(icon, color: Colors.grey[600]),
    ),
    title: Text(
      title,
      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
    ),
    onTap: () {

    },
  );
}
