import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/widget/custom_cachednetwork_image.dart';
import '../../../search/presentation/pages/product_details.dart';
import '../../domain/home_entities/featured_products_entity.dart';


class FeatureProductsCard extends StatelessWidget {
  final FeaturedProductsEntity product;
  const FeatureProductsCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16.w),
      child: InkWell(
        onTap: (){
          context.pushNamed(ProductDetailsScreen(products: product));
        },
        child: SizedBox(
          height: 227.h,
          width: 126.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child:buildCustomNetworkImage(context,product.images!.first,126, 172)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$ ${ product.price}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

}
// String _getValidImageUrl(FeaturedProductsEntity product) {
//   if (product.images != null &&
//       product.images!.isNotEmpty &&
//       product.images!.first.isNotEmpty) {
//     return product.images!.first;
//   }
//
//   if (product.category?.image != null &&
//       product.category!.image!.isNotEmpty) {
//     return product.category!.image!;
//   }
//
//   return 'https://via.placeholder.com/126x172.png?text=No+Image';
// }