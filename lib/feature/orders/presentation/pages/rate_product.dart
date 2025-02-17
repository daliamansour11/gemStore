import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gem_store/feature/orders/presentation/pages/shareFeedBack.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/customAppBar.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_button.dart';
class RateProduct extends StatefulWidget {
  const RateProduct({Key? key}) : super(key: key);

  @override
  _RateProductScreenState createState() => _RateProductScreenState();
}

class _RateProductScreenState extends State<RateProduct> {
  double ratingRev = 4.0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(title: "Rate Product")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              RatingBar.builder(
                initialRating: ratingRev,
                itemPadding: EdgeInsets.all(8),
                itemSize: 45,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color(0xff508A7B),
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    ratingRev = rating;
                  });
                },
              ),
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: BoxBorder.lerp(
                      Border.all(
                          color: const Color.fromARGB(26, 221, 219, 219)),
                      Border.all(color: Color.fromARGB(26, 221, 219, 219)),
                      0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: TextField(
                  controller: reviewController,
                  maxLength: 50,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    hintText:
                        "Would you like to write anything about this product?",
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      text: "Submit Review",
                      color: Color(0xff343434),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShareFeedBackScreen(),
                            ));
                      },
                      isfill: true)),
            ],
          ),
        ),
      ),
    );
  }
}
