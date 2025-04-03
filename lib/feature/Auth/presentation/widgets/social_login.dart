import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/constants/constants.dart' as ColorsManger;
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/bottom_navigation.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});
// TODO: Do not add logic in UI code so make GoogleLoginCubit and use it here
  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    await googleSignIn.signOut();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()));
  }

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
            _buildSocialIcon('assets/images/google.png', () {
              signInWithGoogle(context);
            }),
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
