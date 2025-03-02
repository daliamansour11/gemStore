import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extentions/extentions.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../track_order.dart';
// TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

class CutomGreyOrderBox extends StatelessWidget {
  String title;
  String description;
  AssetImage image;
  final VoidCallback? goto;
  CutomGreyOrderBox({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.goto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.r),
        color: ColorsManger.greyBoxColor,
        boxShadow: [kCustomBoxShadow],
      ),
      child: Padding(
        padding: 12.all,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsManger.white),
                  ),
                  12.vs,
                  InkWell(
                    onTap: goto != null
                        ? () {
                            // TODO:Use generateRoute with named routes. Create a separate file for screen imports and export them to the generateRoute file.
                            context.pushNamed(const OrderTrack());
                          }
                        : () {},
                    child: Text(description,
                        style: TextStyle(color: ColorsManger.white, fontSize: 12.sp)),
                  ),
                ],
              ),
            ),
            Padding(
                padding: 20.all,
                child: Image(
                    image: image, fit: BoxFit.contain, color: ColorsManger.white)),
          ],
        ),
      ),
    );
  }
}
