import 'dart:ui';

class Order {
  final int id;
  final String trackingNumber;
  final String date;
  final int quantity;
  final double subtotal;
  final String status;
  final Color color;

  Order({
    required this.id,
    required this.trackingNumber,
    required this.date,
    required this.quantity,
    required this.subtotal,
    required this.status,
    required this.color,
  });
}
