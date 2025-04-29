import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/theme_data.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/services/firebase_analytic.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';

class DiscoverListViewItem extends StatefulWidget {
  const DiscoverListViewItem({super.key});

  @override
  State<DiscoverListViewItem> createState() => _DiscoverListViewItemState();
}

class _DiscoverListViewItemState extends State<DiscoverListViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryType.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          child:ExpansionTile(
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
            ),
            collapsedShape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
            ),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            trailing: const SizedBox.shrink(),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
              child: _categoryCard(
                categoryType[index],
                categoryImage[index],
                circleColor[index],
              ),
            ),
            children: items[index].map((item) {
              return Padding(
                padding:const  EdgeInsets.symmetric(horizontal: AppPadding.p31, vertical: AppPadding.p5),
                child: _itemTile(item),
              );
            }).toList(),
          )

        );
      },
    );
  }

  Widget _itemTile(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s15),
        color: ColorsManger.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 1),
            blurRadius: 6,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p18, vertical: AppPadding.p8),
        title: Text(
          "${item['name']}",
          style: appTheme().textTheme.titleMedium,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${item['count']} items", style: const TextStyle(color: Colors.grey)),
            const SizedBox(width: 5),
            const Icon(Icons.arrow_forward_ios, size: 12, color: ColorsManger.dark),
          ],
        ),
        onTap: () {
          FirebaseAnalytic.buttonClicked('Clicked on ${item['name']}');
        },
      ),
    );
  }

  Widget _categoryCard(String title, String imageUrl, Color backgroundColor) {
    return SizedBox(
      height: 126.h,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor(title),
            borderRadius: BorderRadius.circular(AppSize.s15),
          ),
          child: Stack(
            children: [

              Positioned(
                right: 30.w,
                top: 18.h,
                child: _buildCircle(backgroundColor.withOpacity(0.2), 91.w),
              ),
              Positioned(
                right: 45.w,
                top: 33.h,
                bottom: 20.h,
                child: _buildCircle(backgroundColor.withOpacity(0.4), 63.w),
              ),
              // Text title
              Positioned(
                left: AppPadding.p18,
                top: 50.h,
                child: Text(
                  title,
                  style: appTheme().textTheme.bodySmall,
                ),
              ),
              // Image
              Positioned(
                right: AppPadding.p20,
                top: 10.h,
                bottom: 10.h,
                child: _buildImage(context, imageUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imageUrl) {
    return SizedBox(
      width: 110.w,
      height: 125.h,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => ClipOval(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManger.lightGrey,
          ),
          child: const Center(
            child: CupertinoActivityIndicator(radius: 12),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}


Color cardColor(String categoryName) {
  switch (categoryName) {
    case 'CLOTHING':
      return ColorsManger.category1Color;
    case 'ACCESSORIES':
      return ColorsManger.category2Color;
    case 'SHOES':
      return ColorsManger.category3Color;
    case 'COLLECTION':
      return ColorsManger.category4Color;
    default:
      return Colors.white;
  }
}

