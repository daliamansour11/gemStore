import 'package:flutter/material.dart';
import 'package:gem_store/feature/orders/presentation/pages/track_order.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/customAppBar.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_button.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_order_grey_box__shop.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_order_item.dart';


class OrderInfoTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: "Order #1524")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CutomGreyOrderBox(
                  title: "Your order is on the way",
                  description: "Click here to track your order",
                  goto: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderTrack()),
                    );
                  },
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
                          detailName: "Sportwear Set",
                          quantity: "x1",
                          price: "\$80.00"),
                      CustomOrderItem(
                          isBold: false,
                          detailName: "Cotton T-shirt",
                          quantity: "x1",
                          price: "\$30.00"),
                      SizedBox(
                        height: 20,
                      ),
                      CustomOrderItem(
                          withquantity: false,
                          isBold: true,
                          detailName: "Sub Total",
                          price: "110.00"),
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
                          price: "\$110.00"),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: Color(0xff343434),
                          isfill: true,
                          onPressed: () {},
                          text: "Continue shopping",
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
