import 'package:flutter/material.dart';
import 'package:gem_store/feature/orders/presentation/pages/rate_product.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/customAppBar.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_button.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_order_grey_box__shop.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_order_item.dart';


class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: "Order #1524")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CutomGreyOrderBox(
                  title: "Your order is delivered",
                  description: "Rate product to get 5 points for collect.",
                  image: AssetImage(
                    "assets/deliver.png",
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomOrderItem(
                          isOrderDetials: true,
                          withquantity: false,
                          isBold: false,
                          detailName: "Order number",
                          price: "#1514"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomOrderItem(
                          isOrderDetials: true,
                          withquantity: false,
                          isBold: false,
                          detailName: "Tracking Number",
                          price: "IK987362341"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomOrderItem(
                          isOrderDetials: true,
                          withquantity: false,
                          isBold: false,
                          detailName: "Delivery address",
                          price: "SBI Building, Software Park"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomOrderItem(
                          isBold: false,
                          detailName: "Maxi Dress",
                          quantity: "x1",
                          price: "\$68.00"),
                      CustomOrderItem(
                          isBold: false,
                          detailName: "Linen Dress",
                          quantity: "x1",
                          price: "\$52.00"),
                      SizedBox(
                        height: 20,
                      ),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: "Sub Total",
                          price: "120.00"),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: "Shipping",
                          price: "0.00"),
                      Divider(),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: "Total",
                          price: "\$120.00"),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        isfill: false,
                        text: "Return home",
                        color: Colors.white,
                        onPressed: () {}),
                    CustomButton(
                        isfill: true,
                        text: "Rate",
                        color: Color(0xff343434),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RateProduct()),
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
