import 'package:flutter/material.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/bottom_navigation.dart';

import 'package:flutter/material.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, // ✅ استخدم المفتاح اللي من الشاشة
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              } else if (!value.contains('@')) {
                return 'Enter valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                debugPrint('Forgot Password Clicked!');
              },
              child: const Text(AppString.forgetPassword),
            ),
          ),
        ],
      ),
    );
  }
}

// class LoginButton extends StatefulWidget {
//   const LoginButton({super.key});

//   @override
//   State<LoginButton> createState() => _LoginButtonState();
// }

// class _LoginButtonState extends State<LoginButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           final formState = Form.of(context);
//           if (formState != null && formState.validate()) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const BottomNavigation()),
//             );
//           }
//         },

//         style: ElevatedButton.styleFrom(
//           backgroundColor: ColorsManger.black,
//           padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
//           shape: RoundedRectangleBorder(

//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         child: const Text(
//           AppString.logIn,
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
