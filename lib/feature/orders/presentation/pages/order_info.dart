import 'package:flutter/material.dart';

class OrderInfoOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Ensure background is visible
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Soft shadow
                blurRadius: 8, // Smooth blur
                spreadRadius: 2, // Light spread
                offset: Offset(0, 2), // Subtle downward shadow
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 20, // Adjust size as needed
            backgroundColor: Colors.white, // Match background
            child:
                Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          ),
        ),
        title: Text("Check out", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on, color: Colors.black),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Icon(Icons.check_circle, color: Colors.black),
              ],
            ),
          ),
          Spacer(),
          Text(
            "Order Completed",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Image(image: AssetImage("assets/order.png")),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Thank you for your purchase.\nYou can view your order in ‘My Orders’ section.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              ),
              child: Text("Continue shopping",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
          Spacer(),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
