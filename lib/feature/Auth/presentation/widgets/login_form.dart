import 'package:flutter/material.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/bottom_navigation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>{
late TextEditingController emailController;
late  TextEditingController passwordController;
final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey ,
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
                    style: TextTheme.of(context).labelSmall,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final formState = Form.of(context);
          if (formState != null && formState.validate()) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavigation()),
            );
          }
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManger.black,
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
