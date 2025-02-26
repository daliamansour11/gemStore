import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manger.dart';

class ShadowImage extends StatelessWidget {
  const ShadowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.splashShadow),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
