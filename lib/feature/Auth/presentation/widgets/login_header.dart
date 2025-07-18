import 'package:flutter/material.dart';

import '../../../../core/resources/strings_manger.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.logInto,
          style: TextTheme.of(context).bodyMedium,
          // TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          AppString.yourAccount,
          style: TextTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
