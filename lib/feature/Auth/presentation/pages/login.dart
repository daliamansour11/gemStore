import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../cubit/google_login_cubit.dart';
import '../cubit/api_cubit_cubit.dart'; // AuthCubit
import '../widgets/LoginButton.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../widgets/social_login.dart';
import '../../../../service_locator.dart'; // s1

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ✅ AuthCubit (API Login)
        BlocProvider<AuthCubit>(
          create: (_) => s1<AuthCubit>(),
        ),
        // ✅ GoogleLoginCubit (Google Sign-In)
        BlocProvider<GoogleLoginCubit>(
          create: (_) => GoogleLoginCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorsManger.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeader(),
                32.vs,
                LoginForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: _formKey,
                ),
                24.vs,
                LoginButton(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: _formKey,
                ),
                24.vs,
                const SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
