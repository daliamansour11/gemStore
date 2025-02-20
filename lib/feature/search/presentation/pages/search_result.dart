import 'package:flutter/material.dart';
import '../../../../config/theme/theme_data.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';

import '../../../../core/resources/strings_manger.dart';
import '../../data/model/product_model.dart';
import '../widgets/search_result_card.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    super.key,
  });

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Product> products = [
    Product(
      oldPrice: 59.99,
      name: 'Fitted Waist Dress',
      price: 47.99,
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=bfFI0IdIdmVgMgjP0DdS~Irk-YppivfhK~Bo~y3h2BhLpKFbfGvHEgbe8qWscfT51WWp2A5Y4u1uGSh379FATPOItoUlTP9Sd7fvE1qnWmy0lXqyMv8h9Fx8K~RjmExAixy~ez2lnX7jkGcvC4lzgfMok693v6GVwpAH0U3pyyPqhzsLYl5qGrANwRIl0n3eqzvXl2fQdSjT2CseR5uFJftvDEJIFQVyTAj-DuiV8jy5bQVJkq15cAbu0FWKFV43q5BIwg2~hQqUaMf7IYagoKC9Oh33wPF5sEAq5t1DqCRyBmp-PZf8QB4iJmGy9kzQczkQUz0CqJlcgsg2mH-d2Q__',
      rating: 4.5,
      description: 'A stylish fitted waist dress perfect for any occasion.',
      review: 65,
      id: 0,
    ),
    Product(
      name: 'Sportwear Set',
      price: 80.00,
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/c793/6776/96d160379456b9e0b7274fcb6b4facc6?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=bfFI0IdIdmVgMgjP0DdS~Irk-YppivfhK~Bo~y3h2BhLpKFbfGvHEgbe8qWscfT51WWp2A5Y4u1uGSh379FATPOItoUlTP9Sd7fvE1qnWmy0lXqyMv8h9Fx8K~RjmExAixy~ez2lnX7jkGcvC4lzgfMok693v6GVwpAH0U3pyyPqhzsLYl5qGrANwRIl0n3eqzvXl2fQdSjT2CseR5uFJftvDEJIFQVyTAj-DuiV8jy5bQVJkq15cAbu0FWKFV43q5BIwg2~hQqUaMf7IYagoKC9Oh33wPF5sEAq5t1DqCRyBmp-PZf8QB4iJmGy9kzQczkQUz0CqJlcgsg2mH-d2Q__',
      rating: 4.9,
      description: 'Comfortable and stylish sportswear set.',
      oldPrice: 99.99,
      review: 43,
      id: 1,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      body: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p40,
                    top: AppPadding.p18,
                    bottom: AppPadding.p18),
                child: Text(
                  AppString.found_sreach,
                  style: appTheme().textTheme.labelLarge,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 26.0, right: 28),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
