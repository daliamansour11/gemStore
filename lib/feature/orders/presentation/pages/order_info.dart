import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
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
        ),
        title: Text("Order #1514"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff575757),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your order is delivered",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text("Rate product to get 5 points for collect.",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Image(
                      image: AssetImage(
                        "assets/deliver.png",
                      ),
                      fit: BoxFit.contain,
                      color: Colors.white),
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
                  _buildDetailRow("Order number", "#1514"),
                  _buildDetailRow("Tracking Number", "IK987362341"),
                  _buildDetailRow(
                      "Delivery address", "SBI Building, Software Park"),
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
                  _buildOrderItem("Maxi Dress", "x1", "\$68.00"),
                  _buildOrderItem("Linen Dress", "x1", "\$52.00"),
                  _buildDetailRow("Sub Total", "120.00"),
                  _buildDetailRow("Shipping", "0.00"),
                  Divider(),
                  _buildDetailRow("Total", "\$120.00", isBold: true),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                          color:
                              Color(0xff343434)), // Sets border color to grey
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text("Return home",
                        style: TextStyle(color: Color(0xff343434))),
                  ),
                ),

                // _buildButton("Return home", , () {}),
                _buildButton("Rate", Color(0xff343434), () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.black54)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String name, String quantity, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Row(
            children: [
              Text(quantity, style: TextStyle(color: Colors.black54)),
              SizedBox(width: 10),
              Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class OrderInfoOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           margin: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white, // Ensure background is visible
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1), // Soft shadow
//                 blurRadius: 8, // Smooth blur
//                 spreadRadius: 2, // Light spread
//                 offset: Offset(0, 2), // Subtle downward shadow
//               ),
//             ],
//           ),
//           child: CircleAvatar(
//             radius: 20, // Adjust size as needed
//             backgroundColor: Colors.white, // Match background
//             child:
//                 Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
//           ),
//         ),
//         title: Text("Check out", style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 50.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(Icons.location_on, color: Colors.black),
//                 Expanded(
//                   child: Divider(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Icon(Icons.check_circle, color: Colors.black),
//               ],
//             ),
//           ),
//           Spacer(),
//           Text(
//             "Order Completed",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           Spacer(),
//           Image(image: AssetImage("assets/order.png")),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: Text(
//               "Thank you for your purchase.\nYou can view your order in ‘My Orders’ section.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey[800],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//               ),
//               child: Text("Continue shopping",
//                   style: TextStyle(fontSize: 16, color: Colors.white)),
//             ),
//           ),
//           Spacer(),
//         ],
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }
