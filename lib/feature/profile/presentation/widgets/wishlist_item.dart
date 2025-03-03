import 'package:flutter/material.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../../data/model/wishlist_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItem extends StatelessWidget {
  final WishlistModel item;

  const WishlistItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.lightWhiteColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    ImageAssets.onboardingLogo1,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12.h,
                  right: 10.h,
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: ColorsManger.lightWhiteColor,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: ColorsManger.red,
                        size: 15.sp,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.h, vertical: AppPadding.p6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      item.price,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    if (item.oldPrice != null)
                      Padding(
                        padding: EdgeInsets.only(left: AppPadding.p6.w),
                        child: Text(
                          item.oldPrice!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < item.rating.round()
                          ? Icons.star
                          : Icons.star_border_outlined,
                      color: ColorsManger.ratingColor,
                      size: 15.sp,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
