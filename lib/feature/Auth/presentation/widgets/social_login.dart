import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart' as ColorsManger;
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/strings_manger.dart';
import '../cubit/google_login_cubit.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            AppString.logInWith,
            style: TextStyle(
                color: ColorsManger.grey, fontWeight: FontWeight.w500),
          ),
        ),
        16.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon('assets/images/apple.png', () {}),
            const SizedBox(width: 16),
            BlocConsumer<GoogleLoginCubit, GoogleLoginState>(
              listener: (context, state) {
                if (state is GoogleLoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                if (state is GoogleLoginLoading) {
                  return const CircularProgressIndicator();
                }
                return _buildSocialIcon('assets/images/google.png', () {
                  context.read<GoogleLoginCubit>().signInWithGoogle(context);
                });
              },
            ),
            const SizedBox(width: 16),
            _buildSocialIcon('assets/images/facebook.png', () {}),
          ],
        ),
      ],
    );
  }
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
