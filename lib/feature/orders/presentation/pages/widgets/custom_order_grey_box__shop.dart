import 'package:flutter/material.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../track_order.dart';
// TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

class CutomGreyOrderBox extends StatelessWidget {
  String title;
  String description;
  AssetImage image;
  final VoidCallback? goto;
  CutomGreyOrderBox({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    this.goto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff575757),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: 12.all,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  12.vs,
                  InkWell(
                    onTap: goto != null
                        ? () {
                          // TODO:Use generateRoute with named routes. Create a separate file for screen imports and export them to the generateRoute file.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OrderTrack()),
                            );
                          }
                        : () {},
                    child: Text(description,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Image(
                    image: image, fit: BoxFit.contain, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
