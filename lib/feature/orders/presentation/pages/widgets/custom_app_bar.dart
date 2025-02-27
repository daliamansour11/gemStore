import 'package:flutter/material.dart';

import '../../../../../config/theme/theme_data.dart';


class CustomAppBar extends StatelessWidget {
  String title;
  CustomAppBar({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin:const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset:const  Offset(0, 2),
              ),
            ],
          ),
          child:const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child:
                Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          ),
        ),
      ),
      title: Text(title,style: appTheme().textTheme.bodyLarge,),
      centerTitle: true,
    );
  }
}
