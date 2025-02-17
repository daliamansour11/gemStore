import 'package:flutter/material.dart';
import 'package:gem_store/config/theme/themeData.dart';
import 'package:gem_store/core/resources/colors_manger.dart';
import 'package:gem_store/core/resources/values_manger.dart';

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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Center(
                child: Image.network(widget.products.imageUrl,
                  height: 250,
                ),
              ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               Padding(
            padding: const EdgeInsets.only(left: AppPadding.p33,top: AppPadding.p24,bottom: AppPadding.p22),

            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManger.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      offset:const Offset(0, 1),

                      blurRadius: 1,

                    ),
                  ],
                ),
                child: Center(
                  child: IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios,size: 15,),),
                ),
                            ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p33,top: AppPadding.p24,bottom: AppPadding.p22,right: AppPadding.p32),

                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManger.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        offset:const Offset(0, 1),

                        blurRadius: 1,

                      ),
                    ],
                  ),
                  child: Center(
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
              ),
              ],
            ))]),


            Padding(
              padding: const EdgeInsets.only(left: 32.0,right: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("${widget.products.name}",
                       style: appTheme().textTheme.labelMedium,
                     ),
                     const  SizedBox(height: 8),
                     Padding(
                       padding: const EdgeInsets.only(right: AppPadding.p8,top: AppPadding.p3),
                       child: Text(
                         '\$${widget.products.price}',
                         style: appTheme().textTheme.titleMedium,
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
                  const  SizedBox(height: 8),
                   Padding(
                     padding: const EdgeInsets.only(left: AppPadding.p4),
                     child: Text("${widget.products.description}",
                      style:appTheme().textTheme.labelSmall,
                                       ),
                   ),
                  const SizedBox(height: 16),

                    // 'Reviews',
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Reviews',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Image.asset("assets/icons/Expand_down.png")

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
                    Image.asset("assets/icons/Expand_down.png")

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
                              child: Center(child: Image.network("assets/images/welcome.png",fit: BoxFit.cover,)),
                            ),
                          ),
                          const  SizedBox(height: 4),
                          const  Text('dress', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                          const Text('\$ 39.99', style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600)),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}