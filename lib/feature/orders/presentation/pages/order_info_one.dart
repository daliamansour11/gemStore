import 'package:flutter/material.dart';
import 'rate_product.dart';
import 'widgets/customAppBar.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_order_grey_box__shop.dart';
import 'widgets/custom_order_item.dart';


class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: 'Order #1524')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CutomGreyOrderBox(
                  title: 'Your order is delivered',
                  description: 'Rate product to get 5 points for collect.',
                  image: const AssetImage(
                    'assets/deliver.png',
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomOrderItem(
                          isOrderDetials: true,
                          withquantity: false,
                          isBold: false,
                          detailName: 'Order number',
                          price: '#1514'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomOrderItem(
                          isOrderDetials: true,
                          withquantity: false,
                          isBold: false,
                          detailName: 'Tracking Number',
                          price: 'IK987362341'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomOrderItem(
                          isOrderDetials: true,
                          withquantity: false,
                          isBold: false,
                          detailName: 'Delivery address',
                          price: 'SBI Building, Software Park'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomOrderItem(
                          isBold: false,
                          detailName: 'Maxi Dress',
                          quantity: 'x1',
                          price: '\$68.00'),
                      CustomOrderItem(
                          isBold: false,
                          detailName: 'Linen Dress',
                          quantity: 'x1',
                          price: '\$52.00'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: 'Sub Total',
                          price: '120.00'),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: 'Shipping',
                          price: '0.00'),
                      const Divider(),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: 'Total',
                          price: '\$120.00'),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        isfill: false,
                        text: 'Return home',
                        color: Colors.white,
                        onPressed: () {}),
                    CustomButton(
                        isfill: true,
                        text: 'Rate',
                        color: const Color(0xff343434),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RateProduct()),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
