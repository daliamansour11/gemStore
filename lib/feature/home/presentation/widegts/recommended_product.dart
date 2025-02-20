import 'package:flutter/material.dart';

class RecommendedProducts extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/images/product1.png',
      'title': 'White fashion hoodie',
      'price': '\$29.00'
    },
    {
      'image': 'assets/images/product1.png',
      'title': 'Casual Sweatshirt',
      'price': '\$34.50'
    },
    {
      'image': 'assets/images/product1.png',
      'title': 'Trendy Jacket',
      'price': '\$45.00'
    },
  ];

  RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double productWidth = screenWidth * 0.8; // 80% of screen width
        double productHeight =
            screenWidth * 0.2; // Adjust height based on width

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Show All Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Feature Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Show all',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9B9B9B)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Horizontal Product List
            SizedBox(
              height: productHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(
                      products[index], productWidth, productHeight);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProductCard(
      Map<String, String> product, double width, double height) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product['image']!,
              fit: BoxFit.cover,
              width: height * 0.9,
              height: height * 0.9,
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
                  product['title']!,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                  maxLines: 1, // Limits to one line
                ),
                const SizedBox(height: 4),
                Text(
                  product['price']!,
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
