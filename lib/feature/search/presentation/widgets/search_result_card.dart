import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/values_manger.dart';
import '../../../home/domain/home_entities/featured_products_entity.dart';
import '../pages/product_details.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/models/product_model.dart';
import 'custom_image_widget.dart';

class SearchResultCard extends StatefulWidget {
  const SearchResultCard({super.key,});

  @override
  State<SearchResultCard> createState() => _SearchResultCardState();
}
List<FeaturedProductsEntity>? products;

class _SearchResultCardState extends State<SearchResultCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:  AppPadding.p26,right: AppPadding.p28),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: products!.length,
        itemBuilder: (context, index) {
          return ProductCard( product:products![index],);
        },
      ),
    );
    // return  GestureDetector(
    //   onTap: () {
    //     context.pushNamed(ProductDetailsScreen(products: widget.product));
    //   },
    //   child: ProductCard(
    //     product: widget.product,
    //   ),
    // );
  }
}


class ProductCard extends StatefulWidget {
  final FeaturedProductsEntity product;
  const  ProductCard({super.key, required this.product,});
  // final FirebaseAnalytics analytics;
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(ProductDetailsScreen(products: widget.product,  ));
      },
      child: Hero(
        // tag: [//]!.id!??0,
          tag: widget.product.id!,
          child:  Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),

                          child:CustomImageWidget(product: widget.product,),
                          ),

                        Positioned(
                            top: 8,
                            right: 2,
                            child: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.title!,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '${ widget.product.price}',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              // if (widget.product.oldPrice != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child:
                                Text(
                                  '${widget.product.price}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  //             ),
                                ),

                              ),
                              const SizedBox(height: 4),

                            ],

                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                                5,
                                    (index) => const Icon(Icons.star,
                                    color: ColorsManger.ratingColor, size: 16)),
                          ),
                        ]),
                  ),
                ]),
          )


      ),
    );
  }
}



