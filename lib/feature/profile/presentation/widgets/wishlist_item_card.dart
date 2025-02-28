import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';
import 'wishlist_container _card_img.dart';

class WishlistItemCard extends StatelessWidget {
  const WishlistItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cardImgWhishlist(),
        Padding(
          padding: EdgeInsets.only(left: AppPadding.p8.w, right: AppPadding.p8.w),
          child: Card(
            color: ColorsManger.lightWhiteColor,
            child: ListTile(
              title: Text(
                'Going out outfits',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  color: ColorsManger.category2Color),
              subtitle: const Text('36 items',
                  style: TextStyle(color: ColorsManger.category2Color)),
            ),
          ),
        ),
      ],
    );
  }
}
