import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../config/theme/theme_data.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/global/global.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';

class DiscoverListViewItem extends StatefulWidget {
  const DiscoverListViewItem({super.key});

  @override
  State<DiscoverListViewItem> createState() => _DiscoverListViewItemState();
}

cardColor(String categoryName) {
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


class _DiscoverListViewItemState extends State<DiscoverListViewItem> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: categoryType.length,
      itemBuilder: (context, index) {
        return
        ExpansionTile(
          shape: Border.all(color: Colors.transparent),
          collapsedShape: Border.all(color: Colors.transparent),
        title: _categoryCard(
          categoryType[index],
          categoryImage[index],
          circleColor[index],
        ),

        trailing: const SizedBox.shrink(),
        children: items[index]
            .map((item) => Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p18,
                      right: AppPadding.p18,
                      bottom: AppPadding.p10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorsManger.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          offset: const Offset(0, 1),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        "${item['name']}",
                        style: appTheme().textTheme.titleMedium,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${item['count']} items",
                              style: const TextStyle(color: Colors.grey)),
                          const Icon(Icons.arrow_forward_ios,
                              size: 10, color: ColorsManger.dark),
                        ],
                      ),
                      onTap: () {

                        Global.analytics.logEvent(
                          name: 'searchTextField clicked',
                          parameters: {
                            'button_name': 'searchTextField',
                          },
                        );
                      },
                    ),
                  ),
                ))
            .toList(),
        );




      },
    );
  }

  Widget _categoryCard(
    final String title,
    final String imageUrl,
    final Color backgroundColor,
  ) {
    return Center(
      child: Card(
        child: Container(
          height: 126.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: cardColor(title),
              borderRadius: BorderRadius.circular(AppSize.s15),
              boxShadow: [
                BoxShadow(
                    color: ColorsManger.grey.withOpacity(0.9),
                    offset: const Offset(0, 1),
                    blurRadius: 1)
              ]),
          child: //
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Positioned(
                  top: 58,
                  left: 22,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p18,
                    ),
                    child: Text(
                      title,
                      style: appTheme().textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p56,
                        right: AppPadding.p20,
                        top: AppPadding.p10,
                        bottom: AppPadding.p11),
                    child: Container(
                      width: 105.w,
                      height: 105.h,
                      decoration: BoxDecoration(
                        color: backgroundColor.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p72,
                        right: AppPadding.p40,
                        top: AppPadding.p25,
                        bottom: AppPadding.p26),
                    child: Container(
                      width: 75.w,
                      height: 75.h,
                      decoration: BoxDecoration(
                        color: backgroundColor.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
// right: 10,
                    child: SizedBox(
                      width: 194.w,
                      height: 129.h,
                      child:_buildImage(context,imageUrl)
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildImage(BuildContext context, String imageUrl,
      ){

    return Center(
      child: CachedNetworkImage(
        imageUrl:   imageUrl,
        imageBuilder: (context,imageProvider)=>ClipRRect(
          borderRadius: BorderRadius.circular(10.0),

          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,

                )
            ),
          ),
        ),
        progressIndicatorBuilder: (context,url,downloadProgress)=>
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,

                child:  const CupertinoActivityIndicator(),
              ),
            ),
        errorWidget: (context, url, error) =>  ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,

            child:const Icon(Icons.error),
          ),
        ),
      ),
    );



  }

}
