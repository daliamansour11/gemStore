import 'package:flutter/material.dart';

class FeatureProducts extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'image': 'assets/images/girl1.png', 'title': 'Turtleneck Sweater', 'price': '\$39.99'},
    {'image': 'assets/images/girl1.png', 'title': 'Long Sleeve Dress', 'price': '\$45.00'},
    {'image': 'assets/images/girl1.png', 'title': 'Sportswear Set', 'price': '\$80.00'},
  ];

   FeatureProducts({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {}, // Add navigation or function here
                child: const Text(
                  'Show all',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff9B9B9B)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Horizontal Product List
        SizedBox(
          height: 227,
          width: 340,// Adjusted height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _buildProductCard(products[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return SizedBox(
      width: 160, // Adjust width for proper spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product['image']!,
              fit: BoxFit.cover,
              width: 126,
              height: 172,
            ),
          ),
          const SizedBox(height: 8),
          Text(product['title']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Text(product['price']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
