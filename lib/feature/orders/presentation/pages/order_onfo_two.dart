import 'package:flutter/material.dart';
import 'track_order.dart';
import 'widgets/customAppBar.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_order_grey_box__shop.dart';
import 'widgets/custom_order_item.dart';

class OrderInfoTwo extends StatelessWidget {
  const OrderInfoTwo({super.key});
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: 'Order #1524')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CutomGreyOrderBox(
                  title: 'Your order is on the way',
                  description: 'Click here to track your order',
                  goto: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderTrack()),
                    );
                  },
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
                          detailName: 'Sportwear Set',
                          quantity: 'x1',
                          price: '\$80.00'),
                      CustomOrderItem(
                          isBold: false,
                          detailName: 'Cotton T-shirt',
                          quantity: 'x1',
                          price: '\$30.00'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: 'Sub Total',
                          price: '110.00'),
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
                          price: '\$110.00'),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: const Color(0xff343434),
                          isfill: true,
                          onPressed: () {},
                          text: 'Continue shopping',
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
