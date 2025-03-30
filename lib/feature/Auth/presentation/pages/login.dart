import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';

import '../../../../core/resources/colors_manger.dart';
import '../cubit/google_login_cubit.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../widgets/social_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleLoginCubit(),
      child: Scaffold(
        backgroundColor: ColorsManger.white,
        body: Padding(
          padding: 32.ph,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const LoginHeader(),
              32.vs,
              const LoginForm(),
              24.vs,
              const LoginButton(),
              24.vs,
              const SocialLogin(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
