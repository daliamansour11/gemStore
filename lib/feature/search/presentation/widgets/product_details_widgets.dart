
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../config/theme/theme_data.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/firebase_analytic.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/widget/custom_cachednetwork_image.dart';
import '../../../home/domain/home_entities/featured_products_entity.dart';

class ProductDetailsWidgets extends StatefulWidget {
  const ProductDetailsWidgets({super.key, required this.products});

  final FeaturedProductsEntity products;

  @override
  State<ProductDetailsWidgets> createState() => _ProductDetailsWidgetsState();
}

bool isFavorite = false;
final List<String> userFeedBack=[

];
class _ProductDetailsWidgetsState extends State<ProductDetailsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: AppPadding.p80,
                  left: AppPadding.p80,
                  right: AppPadding.p80,
                  child: Center(
                    child: CircleAvatar(
                      radius: 234,
                      backgroundColor: const Color(0xffEACAB7).withOpacity(.9),
                    ),
                  ),
                ),
                Container(
                  height: 400.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFCFA),
                  ),
                  child:
                  ImageSlideshow(

                    initialPage: 0,
                    indicatorColor: ColorsManger.btnColor,
                    indicatorBackgroundColor: ColorsManger.grey,

                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },
                    autoPlayInterval: 3000,

                    isLoop: false,
                      children: [
        buildCustomNetworkImage(context, widget.products.images!.first, double.infinity, 400.h),
        buildCustomNetworkImage(context, widget.products.images!.first, double.infinity, 400.h),
        buildCustomNetworkImage(context, widget.products.images!.first, double.infinity, 400.h),

      ],
                  ),),

                Positioned(
                  top: AppPadding.p40,
                  left: AppPadding.p33,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: ColorsManger.dark,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: AppPadding.p40,
                  // left: AppPadding.p33,
                  right: AppPadding.p32,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {

                        FirebaseAnalytic.buttonClicked('favourite_button  clicked');

                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 330,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 10),
                ],
              ),
              child: _productDateWidget()),
        ),
      ],
    );
  }

  Widget _productDateWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.products.title!,
                    style:const  TextStyle(fontSize: FontSize.s20, fontWeight: FontWeight.bold,
                        color: ColorsManger.dark,
                    ), maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        right: AppPadding.p8, top: AppPadding.p3),
                    child: Text(
                      '\$${widget.products.price}',
                      style: appTheme().textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              8.vs,
              Padding(
                padding:4.pl,
                child: Row(
                  children: List.generate(
                      5,
                          (index) => const Icon(
                        Icons.star,
                        color: ColorsManger.ratingColor,
                        size: FontSize.s20,
                      )),
                ),
              ),

              ExpansionTile(
                  shape: Border.all(color: Colors.transparent),
                  collapsedShape: Border.all(color: Colors.transparent),
                  title:     const Text(
                    AppString.descriptionStr,
                    style: TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.bold),

                  ),

                  children: [
                    Padding(
                      padding:  4.pl,
                      child:  ReadMoreText(
                      widget.products.description!,
                        trimLines: 3,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Read less',
                        moreStyle: const TextStyle(fontSize: 14, color: Colors.blue),
                        lessStyle: const TextStyle(fontSize: 14, color: Colors.blue),
                      style: appTheme().textTheme.labelMedium,
                      ),
                    ),]
              ),
              16.vs,
              ExpansionTile(
                  shape: Border.all(color: Colors.transparent),
                  collapsedShape: Border.all(color: Colors.transparent),
                  title: const Text(
                    AppString.reviewsStr,
                    style: TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(

                            trailing: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                      5,
                                          (index) =>
                                      const Icon(Icons.star,
                                          color: ColorsManger.ratingColor, size: FontSize.s16)),
                                ),

                              ],
                            ),
                          ),
                          ListTile(
                            leading: const CircleAvatar(),
                            title: const Text('Jennifer Rose'),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                  5,
                                      (index) =>
                                  const Icon(Icons.star,
                                      color: ColorsManger.ratingColor, size: FontSize.s16)),
                            ),
                            trailing:  Padding(
                              padding:  4.pr,
                              child:const Text('3m ago',
                                  style: TextStyle(
                                      fontSize: 10, fontWeight: FontWeight.w300)),
                            ),
                          ),
                          Padding(
                            padding: 15.all,
                            child:  Text(AppString.userFeedBack,
                              style: appTheme().textTheme.titleSmall,

                            ),
                          ),

                          ListTile(
                            leading: const CircleAvatar(),
                            title: const Text('Kelly Rihana'),
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                  5,
                                      (index) =>
                                  const Icon(Icons.star,
                                      color: ColorsManger.ratingColor, size: FontSize.s16)),
                            ),
                            trailing:  Padding(
                              padding:  8.pr,
                              child:const Text('3 hour ago',
                                  style: TextStyle(
                                      fontSize: FontSize.s10, fontWeight: FontWeight.w300)),
                            ),
                          ),
                          Padding(
                            padding: 15.all,
                            child:  Text(AppString.userFeedBack,
                              style: appTheme().textTheme.titleSmall,
                            ),
                          ),

                          16.vs,                      ],
                      ),
                    )
                  ]
              ),

              ExpansionTile(
                shape: Border.all(color: Colors.transparent),
                collapsedShape: Border.all(color: Colors.transparent),
                title:     const Text(
                  AppString.similarProductStr,
                  style: TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.bold),

                ),


                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 172,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                  child:
                                  buildCustomNetworkImage(context, widget.products.images!.first, double.infinity, 172.h),
                              ),
                            ),
                          ),
                          4.vs,
                          Text(widget.products.title!,
                              style: const TextStyle(
                                  fontSize: FontSize.s12, fontWeight: FontWeight.w500)),
                          Text('\$ ${widget.products.price}',
                              style: const TextStyle(
                                  fontSize: FontSize.s14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ],
                      );
                    },
                  ),
                ],
              ),

            ]
        ),
        // const SizedBox(height: 8),


      ),
    );
  }
}