import 'package:flutter/material.dart';
import 'package:gem_store/feature/orders/presentation/pages/track_order.dart';

class CutomGreyOrderBox extends StatelessWidget {
  String title;
  String description;
  AssetImage image;
  final VoidCallback? goto;
  CutomGreyOrderBox({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    this.goto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: goto != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderTrack()),
                            );
                          }
                        : () {},
                    child: Text(description,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Image(
                    image: image, fit: BoxFit.contain, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
