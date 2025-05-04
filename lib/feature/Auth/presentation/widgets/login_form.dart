import 'package:flutter/material.dart';
import '../../../../core/services/firebase_analytic.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/bottom_navigation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: AppString.emailLabel,
            border: UnderlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: AppString.passwordLabel,
            border: UnderlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                debugPrint('Forgot Password Clicked!');
              },
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  AppString.forgetPassword,
                  style: TextStyle(
                      color: ColorsManger.grey, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
          print('Login Button Clicked!');
          // FirebaseAnalytic.buttonClicked('login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManger.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          AppString.logIn,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
