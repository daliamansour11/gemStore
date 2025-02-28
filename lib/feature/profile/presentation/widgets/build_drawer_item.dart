import 'package:flutter/material.dart';

Widget buildDrawerItem(IconData icon, String title , void Function()? onPressed) {
  return ListTile(
    leading: IconButton(
      onPressed: () {},
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
