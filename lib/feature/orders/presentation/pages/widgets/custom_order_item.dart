// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomOrderItem extends StatelessWidget {
  bool isOrderDetials = false;
  String detailName;
  String? quantity;
  String price;
  bool isBold = false;
  bool withquantity = true;
  CustomOrderItem({
    super.key,
    required this.detailName,
    this.quantity,
    required this.price,
    this.withquantity = true,
    this.isOrderDetials = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(detailName,
              style: TextStyle(
                  color: isOrderDetials ? Colors.black54 : Colors.black)),
          Row(
            children: [
              withquantity
                  ? Text(quantity!, style: const TextStyle(color: Colors.black54))
                  : const Text(''),
              const SizedBox(width: 10),
              Text(price,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight:
                          isBold ? FontWeight.bold : FontWeight.normal)),
            ],
          ),
        ],
      ),
    );
  }
}
