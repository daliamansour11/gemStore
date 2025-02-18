import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme/themeData.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/resources/values_manger.dart';

import '../../data/model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {

final Product products;
  const ProductDetailsScreen({required this.products,super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Column(
            children: [
              // Image Section with Back & Favorite Buttons
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
                    decoration:  BoxDecoration(

                      color:Color(0xffFFFCFA) ,

                    ),
                    child:Image.network(widget.products.imageUrl, // Replace with your image
        fit: BoxFit.cover,
                  ),),


                  Positioned(
                    top: AppPadding.p59,
                    left: AppPadding.p33,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios,size: 15,color: ColorsManger.dark,),),
                    ),
                  ),

                  Positioned(
                    top: AppPadding.p59,
                    // left: AppPadding.p33,
                    right: AppPadding.p32,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                                                  icon: Icon(
                                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                                    color: isFavorite ? Colors.red : Colors.grey,size: 18,
                                                  ),
                                                  onPressed: () {
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

          // Product Details (Overlapping the Image)
          Positioned(
            top: 370,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 10),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${widget.products.name}',
                                        style: appTheme().textTheme.labelMedium,
                                      ),
                                      const  SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.only(right: AppPadding.p8,top: AppPadding.p3),
                                        child: Text(
                                          '\$${widget.products.price}',
                                          style: appTheme().textTheme.bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: AppPadding.p4),
                                    child: Row(
                                      children: List.generate(5, (index) =>const Icon(Icons.star, color: ColorsManger.ratingColor, size: 20,)),
                                    ),
                                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(AppString.description_str
                          ,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Image.asset('assets/icons/Expand_down.png')

                      ],),
                                  const  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.only(left: AppPadding.p4),
                                    child: Text('${widget.products.description}',
                                      style:appTheme().textTheme.labelSmall,
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // 'Reviews',
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        AppString.reviews_str,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset('assets/icons/Expand_down.png')

                                    ],),
                    ListTile(
                      leading: Text(
    '${widget.products.rating} (${widget.products.review})',
    style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      trailing:Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(5, (index) =>const Icon(Icons.star, color: ColorsManger.ratingColor, size: 16)),

                          ),
                          Text(
                            '${widget.products.rating} ${widget.products.review}',
                            style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w300),),
                        ],
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Image.asset('assets/icons/Expand_down.png')

                      ],),
                                  const SizedBox(height: 8),
                                  ListTile(
                                    leading:const CircleAvatar(),
                                    title:const Text('Jennifer Icon'),
                                    subtitle:Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(5, (index) =>const Icon(Icons.star, color: ColorsManger.ratingColor, size: 16)),
                                    ),

                                  ),
                                  const Text('I loved it! Amazing comfort and stylish.'),
                                  ListTile(
                                    leading:const CircleAvatar(),
                                    title:const Text('kelly Icon'),
                                    subtitle:Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(5, (index) =>const Icon(Icons.star, color: ColorsManger.ratingColor, size: 16)),
                                    ),
                                    trailing:const Text('5m ago', style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w300)),

                                  ),
                                  const Text('I loved it! Amazing comfort and stylish.'),

                                  const  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Similar Products',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset('assets/icons/Expand_down.png')

                                    ],),
                                  const SizedBox(height: 8),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:const NeverScrollableScrollPhysics(),
                                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
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
                                              height:172,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.grey[200],
                                              ),
                                              child: Center(child: Image.network(widget.products.imageUrl,fit: BoxFit.cover,)),
                                            ),
                                          ),
                                          const  SizedBox(height: 4),
                                            Text(widget.products.name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                           Text('\$ ${widget.products.price}', style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600)),
                                        ],
                                      );
                                    },
                                  ),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Stack(
      //         children: [
      //           Container(
      //             height: 532.h,
      //             color: const Color(0xffFFFCFA),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: AppPadding.p80, right: AppPadding.p80, top: AppPadding.p93,),
      //             child: Container(
      //               width: 234.w,
      //               height: 234.h,
      //               decoration: BoxDecoration(
      //                 color:  const Color(0xffEACAB7).withOpacity(0.8),
      //                 shape: BoxShape.circle,
      //               ),
      //             ),
      //           ),
      //           Center(
      //             child: Align(
      //             alignment: Alignment.topRight,
      //               // right: 10,
      //               child: Padding(
      //                 padding: const EdgeInsets.only(top: 12.0,),
      //                 child: SizedBox(
      //                   height: 532,
      //                   width: double.infinity,
      //                   child: Image.network(
      //                     widget.products.imageUrl,
      //                     height: 532,
      //                     fit: BoxFit.cover, // Makes sure image scales well
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           )
      //           ,
      //
      //           Align(
      //               alignment: Alignment.centerLeft,
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //
      //                   Padding(
      //                     padding: const EdgeInsets.only(left: AppPadding.p33,top: AppPadding.p59,bottom: AppPadding.p22),
      //
      //                     child: Container(
      //                       width: 32,
      //                       height: 32,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         color: ColorsManger.white,
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.grey.withOpacity(0.9),
      //                             offset:const Offset(0, 1),
      //
      //                             blurRadius: 1,
      //
      //                           ),
      //                         ],
      //                       ),
      //                       child: Center(
      //                         child: IconButton(onPressed: () {
      //                           Navigator.pop(context);
      //                         }, icon: const Icon(Icons.arrow_back_ios,size: 15,),),
      //                       ),
      //                     ),
      //                   ),
      //
      //
      //                   Padding(
      //                     padding: const EdgeInsets.only(left: AppPadding.p33,top: AppPadding.p59,bottom: AppPadding.p22,right: AppPadding.p32),
      //
      //                     child: Container(
      //                       width: 32,
      //                       height: 32,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         color: ColorsManger.white,
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.grey.withOpacity(0.9),
      //                             offset:const Offset(0, 1),
      //
      //                             blurRadius: 1,
      //
      //                           ),
      //                         ],
      //                       ),
      //                       child: Center(
      //                         child: IconButton(
      //                           icon: Icon(
      //                             isFavorite ? Icons.favorite : Icons.favorite_border,
      //                             color: isFavorite ? Colors.red : Colors.grey,size: 18,
      //                           ),
      //                           onPressed: () {
      //                             setState(() {
      //                               isFavorite = !isFavorite;
      //                             });
      //                           },
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               )),
      //         ],
      //       ),
      //
      //       Positioned(
      //         top: 406.h,
      //         child: Container(
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20),
      //             color: ColorsManger.white,
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey.withOpacity(0.9),
      //                 offset:const Offset(0, 1),
      //
      //                 blurRadius: 1,
      //
      //               ),
      //             ],
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.only(left:AppPadding.p32,right: AppPadding.p31),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text("${widget.products.name}",
      //                       style: appTheme().textTheme.labelMedium,
      //                     ),
      //                     const  SizedBox(height: 8),
      //                     Padding(
      //                       padding: const EdgeInsets.only(right: AppPadding.p8,top: AppPadding.p3),
      //                       child: Text(
      //                         '\$${widget.products.price}',
      //                         style: appTheme().textTheme.titleMedium,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 const SizedBox(height: 8),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: AppPadding.p4),
      //                   child: Row(
      //                     children: List.generate(5, (index) =>const Icon(Icons.star, color: ColorsManger.ratingColor, size: 20,)),
      //                   ),
      //                 ),
      //                 const  SizedBox(height: 8),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: AppPadding.p4),
      //                   child: Text("${widget.products.description}",
      //                     style:appTheme().textTheme.labelSmall,
      //                   ),
      //                 ),
      //                 const SizedBox(height: 16),
      //
      //                 // 'Reviews',
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     const Text(
      //                       'Reviews',
      //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //                     ),
      //                     Image.asset("assets/icons/Expand_down.png")
      //
      //                   ],),
      //                 const SizedBox(height: 8),
      //                 ListTile(
      //                   leading:const CircleAvatar(),
      //                   title:const Text('Jennifer Icon'),
      //                   subtitle:Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: List.generate(5, (index) =>const Icon(Icons.star, color: ColorsManger.ratingColor, size: 16)),
      //                   ),
      //
      //                 ),
      //                 const Text('I loved it! Amazing comfort and stylish.'),
      //                 ListTile(
      //                   leading:const CircleAvatar(),
      //                   title:const Text('kelly Icon'),
      //                   subtitle:Row(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: List.generate(5, (index) =>const Icon(Icons.star, color: ColorsManger.ratingColor, size: 16)),
      //                   ),
      //
      //                 ),
      //                 const Text('I loved it! Amazing comfort and stylish.'),
      //
      //                 const  SizedBox(height: 16),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     const Text(
      //                       'Similar Products',
      //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //                     ),
      //                     Image.asset("assets/icons/Expand_down.png")
      //
      //                   ],),
      //                 const SizedBox(height: 8),
      //                 GridView.builder(
      //                   shrinkWrap: true,
      //                   physics:const NeverScrollableScrollPhysics(),
      //                   gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      //                     crossAxisCount: 2,
      //                     crossAxisSpacing: 10,
      //                     mainAxisSpacing: 10,
      //                     childAspectRatio: 0.75,
      //                   ),
      //                   itemCount: 3,
      //                   itemBuilder: (context, index) {
      //                     return Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Expanded(
      //                           child: Container(
      //                             height:172,
      //                             decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(10),
      //                               color: Colors.grey[200],
      //                             ),
      //                             child: Center(child: Image.network("assets/images/welcome.png",fit: BoxFit.cover,)),
      //                           ),
      //                         ),
      //                         const  SizedBox(height: 4),
      //                         const  Text('dress', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      //                         const Text('\$ 39.99', style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600)),
      //                       ],
      //                     );
      //                   },
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }

}

