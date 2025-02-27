import 'package:flutter/material.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';

// TODO:Refactor this file into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.
// TODO: Padding needs to be responsive.
// **TODO: Store the string in the app's strings file. This improves maintainability and simplifies future localization.


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManger.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            _LoginHeader(),
            SizedBox(height: 32),
            _LoginForm(),
            SizedBox(height: 24),
            _LoginButton(),
            SizedBox(height: 24),
            _SocialLogin(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

// ويدجت لعرض عنوان تسجيل الدخول
class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.logInto,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          AppString.yourAccount,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// ويدجت لحقول الإدخال الخاصة بالبريد الإلكتروني وكلمة المرور
class _LoginForm extends StatelessWidget {
  const _LoginForm();

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
              child:  Padding(
                padding:const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  AppString.forgetPassword,
                  style: TextStyle(color: ColorsManger.grey, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ويدجت لزر تسجيل الدخول
class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
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

class _SocialLogin extends StatelessWidget {
  const _SocialLogin();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Center(
          child: Text(
            AppString.logInWith,
            style: TextStyle(color: ColorsManger.grey, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon('assets/images/apple.png', () {}),
            const SizedBox(width: 16),
            _buildSocialIcon('assets/images/google.png', () {}),
            const SizedBox(width: 16),
            _buildSocialIcon('assets/images/facebook.png', () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String imagePath, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorsManger.grey),
          ),
          padding: const EdgeInsets.all(10),
          child: Image.asset(imagePath, width: 30, height: 30),
        ),
      ),
    );
  }
}