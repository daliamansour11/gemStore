import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manger.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.splashLogo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
