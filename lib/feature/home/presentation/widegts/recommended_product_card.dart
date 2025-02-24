import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../data/model/product_model.dart';

class RecommendedProductCard extends StatelessWidget {
 final ProductModel product;
  const RecommendedProductCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:203.w ,
      height: 66.h,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:ColorsManger.white,
        borderRadius: BorderRadius.  circular(10),
        boxShadow: const [
          BoxShadow(blurRadius: 4, color: ColorsManger.lightDrak, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
              width: 66.w,
              height: 66.h,
            ),
          ),
          const SizedBox(width: 12),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                  maxLines: 1, // Limits to one line
                ),
                Text(
                  product.price,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
