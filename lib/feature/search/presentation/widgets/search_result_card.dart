import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product_details.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../data/model/product_model.dart';

class SearchResultCard extends StatefulWidget {
  const SearchResultCard({super.key, required this.product});

  final Product product;

  @override
  State<SearchResultCard> createState() => _SearchResultCardState();
}

class _SearchResultCardState extends State<SearchResultCard> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        context.pushNamed(ProductDetailsScreen(products: widget.product));
      },
      child: ProductCard(
        product: widget.product,
      ),
    );
  }
}


class ProductCard extends StatefulWidget {
  final Product product;
  const  ProductCard({super.key, required this.product,});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(ProductDetailsScreen(products: widget.product));
      },
      child: Hero(
        // tag: [//]!.id!??0,
          tag: widget.product.id,
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

                          child:_buildImage(context),
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
                            widget.product.name,
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
                                  '${widget.product.oldPrice.toDouble()}',
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
                            children: [
                              const Icon(Icons.star,
                                  color: ColorsManger.ratingColor, size: 15),
                              const Icon(Icons.star,
                                  color: ColorsManger.ratingColor, size: 15),
                              const Icon(Icons.star,
                                  color: ColorsManger.ratingColor, size: 15),
                              const Icon(Icons.star,
                                  color: ColorsManger.ratingColor, size: 15),
                              const Icon(Icons.star_border_outlined,
                                  color: ColorsManger.ratingColor, size: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '${widget.product.rating} (${widget.product.review})',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ]),
          )


      ),
    );
  }
  Widget _buildImage(BuildContext context){

    return CachedNetworkImage(
      imageUrl:    widget.product.imageUrl,
      imageBuilder: (context,imageProvider)=>ClipRRect(
        borderRadius: BorderRadius.circular(10.0),

        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: ColorsManger.grey,
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
              decoration: BoxDecoration(
                color: ColorsManger.grey,

              ),
              child:  const CupertinoActivityIndicator(),
            ),
          ),
      errorWidget: (context, url, error) =>  ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManger.grey,

          ),
          child:const Icon(Icons.error),
        ),
      ),
    );



  }
}



// class ProductCard extends StatefulWidget {
//   final Product product;
//
//   const ProductCard({
//     super.key,
//     required this.product,
//   });
//
//   @override
//   _ProductCardState createState() => _ProductCardState();
// }
//
// class _ProductCardState extends State<ProductCard> {
//   bool isFavorite = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         context.pushNamed(ProductDetailsScreen(products: widget.product));
//       },
//       child: Hero(
//         // tag: [//]!.id!??0,
//         tag: widget.product.id,
//         child:  Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.network(
//                     widget.product.imageUrl,
//                         width: double.infinity,
//                         height: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const Positioned(
//                       top: 12,
//                       right: 10,
//                       child: CircleAvatar(
//                         radius: 16,
//                         backgroundColor: Colors.white,
//                         child: Icon(
//                           Icons.favorite,
//                           color: Colors.red,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.product.name,
//                       style: const TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.normal),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Text(
//                          '${ widget.product.price}',
//                           style: const TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold),
//                         ),
//                         // if (widget.product.oldPrice != null)
//                           Padding(
//                             padding: const EdgeInsets.only(left: 5),
//                             child:
//                                         Text(
//                                           '${widget.product.oldPrice.toDouble()}',
//                                           style: const TextStyle(
//                                               fontSize: 12,
//                                               color: Colors.grey,
//                                               decoration: TextDecoration.lineThrough),
//                             //             ),
//                           ),
//
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         const Icon(Icons.star,
//                             color: ColorsManger.ratingColor, size: 15),
//                         const Icon(Icons.star,
//                             color: ColorsManger.ratingColor, size: 15),
//                         const Icon(Icons.star,
//                             color: ColorsManger.ratingColor, size: 15),
//                         const Icon(Icons.star,
//                             color: ColorsManger.ratingColor, size: 15),
//                         const Icon(Icons.star_border_outlined,
//                             color: ColorsManger.ratingColor, size: 15),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: Text(
//                             '${widget.product.rating} (${widget.product.review})',
//                             style: const TextStyle(fontSize: 12),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ]),
//     ),
//           ]),
//         )
//
//         // Container(
//         //   // width: 163.w,
//         //   height: 450,
//         //   decoration: BoxDecoration(
//         //     borderRadius: BorderRadius.circular(10)
//         //   ),
//         //   child: Column(
//         //       mainAxisSize: MainAxisSize.min,
//         //       crossAxisAlignment: CrossAxisAlignment.start,
//         //       children: [
//         //         Stack(
//         //           children: [
//         //             // Image widget to display the picture
//         //             ClipRRect(
//         //               borderRadius: BorderRadius.circular(1),
//         //               child: _buildImage(context),
//         //             ),
//         //             Positioned(
//         //               top: 8,
//         //               right: 2,
//         //               child: IconButton(
//         //                 icon: Icon(
//         //                   isFavorite
//         //                       ? Icons.favorite
//         //                       : Icons.favorite_border,
//         //                   color: isFavorite ? Colors.red : Colors.grey,
//         //                 ),
//         //                 onPressed: () {
//         //                   setState(() {
//         //                     isFavorite = !isFavorite;
//         //                   });
//         //                 },
//         //               ),
//         //             ),
//         //           ],
//         //         ),
//         //         SizedBox(height: 3),
//         //         Text(
//         //           widget.product.name,
//         //           style:
//         //               TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//         //           maxLines: 1,
//         //           overflow: TextOverflow.ellipsis,
//         //         ),
//         //         SizedBox(height: 4),
//         //         Row(
//         //           children: [
//         //             Text(
//         //               "${widget.product.price.toDouble()}",
//         //               style: TextStyle(
//         //                   fontSize: 16,
//         //                   fontWeight: FontWeight.bold,
//         //                   color: Colors.black),
//         //             ),
//         //             SizedBox(width: 5),
//         //             Text(
//         //               "${widget.product.oldPrice.toDouble()}",
//         //               style: TextStyle(
//         //                   fontSize: 12,
//         //                   color: Colors.grey,
//         //                   decoration: TextDecoration.lineThrough),
//         //             ),
//         //           ],
//         //         ),
//         //         SizedBox(height: 4),
//         //         Row(
//         //           children: [
//         //             Icon(Icons.star,
//         //                 color: ColorsManger.ratingColor, size: 16),
//         //             Icon(Icons.star,
//         //                 color: ColorsManger.ratingColor, size: 16),
//         //             Icon(Icons.star,
//         //                 color: ColorsManger.ratingColor, size: 16),
//         //             Icon(Icons.star,
//         //                 color: ColorsManger.ratingColor, size: 16),
//         //             SizedBox(width: 4),
//         //             Text(
//         //               '${widget.product.rating.toDouble()}',
//         //               style: TextStyle(fontSize: 12, color: Colors.grey),
//         //             ),
//         //           ],
//         //         ),
//         //       ]),
//         // ),
//       ),
//     );
//   }
//
//   Widget _buildImage(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: widget.product.imageUrl,
//       imageBuilder: (context, imageProvider) => ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Container(
//           width: double.infinity,
//           height: 180,
//           decoration: BoxDecoration(
//               color: ColorsManger.grey,
//               image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
//         ),
//       ),
//       progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Container(
//           width: double.infinity,
//           height: 180.0,
//           decoration: BoxDecoration(
//             color: ColorsManger.grey,
//           ),
//           child: const CupertinoActivityIndicator(),
//         ),
//       ),
//       errorWidget: (context, url, error) => ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Container(
//           width: double.infinity,
//           height: 180,
//           decoration: BoxDecoration(
//             color: ColorsManger.grey,
//           ),
//           child: const Icon(Icons.error),
//         ),
//       ),
//     );
//   }
// }
