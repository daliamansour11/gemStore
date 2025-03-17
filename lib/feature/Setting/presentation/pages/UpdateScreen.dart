import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/firebase_analytics/firebase_analytic.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';


class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytic.logScreenView('UpdateScreen', 'UpdateScreen');

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            AppString.UpdateScreen,
            style:
            TextStyle(fontWeight: FontWeight.bold, color: ColorsManger.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: ColorsManger.black),
            onPressed: () {
              // Add drawer or navigation action here
            },
          ),
        ),
        body: const Padding(
          padding:  EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppString.NewUpdate,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.black,
                        ),
                      ),
                      TextSpan(
                        text: ' !',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.red,
                        ),
                      ),
                    ],
                  ),
                ),

                 Text(
                   AppString.clickIcon,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorsManger.darkGrey),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: IconStore(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconStore extends StatelessWidget {
  const IconStore({super.key});

  void _openStore() async {
    String url = Platform.isIOS
        ? 'https://apps.apple.com/app'
        : 'https://play.google.com/store/apps';

    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = Platform.isIOS
        ? 'assets/apple_store_icon.jpg'
        : 'assets/google_play_icon.jpg';

    return GestureDetector(
      onTap: _openStore,
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: ColorsManger.grey,
            width: 1,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}