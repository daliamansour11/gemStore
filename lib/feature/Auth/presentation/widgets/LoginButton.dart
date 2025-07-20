import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/bottom_navigation.dart';
import '../cubit/api_cubit_cubit.dart';
import '../cubit/api_cubit_state.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const BottomNavigation()),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Center(
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    final currentState = formKey.currentState;
                    if (currentState != null && currentState.validate()) {
                      context.read<AuthCubit>().login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
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
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Text(
                    AppString.logIn,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
        );
      },
    );
  }
}
