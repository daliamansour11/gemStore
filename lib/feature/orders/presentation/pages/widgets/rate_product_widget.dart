
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/resources/strings_manger.dart';
import '../../../../../core/widget/custom_button.dart';
import '../share_feed_back.dart';

class RateProductWidget extends StatefulWidget {
  const RateProductWidget({super.key});

  @override
  State<RateProductWidget> createState() => _RateProductWidgetState();
}
double ratingRev = 4.0;
final TextEditingController reviewController = TextEditingController();


class _RateProductWidgetState extends State<RateProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        RatingBar.builder(
          initialRating: ratingRev,
          itemPadding: 8.all,
          itemSize: 45,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: ColorsManger.ratingColor,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              ratingRev = rating;
            });
          },
        ),
        const SizedBox(height: 30),
        Container(
          padding: 16.all,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: BoxBorder.lerp(
                Border.all(
                    color:  ColorsManger.lightBlack),
                Border.all(
                    color:  ColorsManger.lightBlack),
                0.5),
            boxShadow: [
              BoxShadow(
                color: ColorsManger.dark.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: TextField(
            controller: reviewController,
            maxLength: 50,
            maxLines: 10,
            decoration:  InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: ColorsManger.grey, fontSize: 15),
              hintText:
              AppString.rateProductHint,
            ),
          ),
        ),
       const  SizedBox(height: 100.0),
        SizedBox(
            width: double.infinity,
            child: CustomButton(
                text: AppString.submitReviewBtn,
                color:  ColorsManger.btnColor,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShareFeedBackScreen(),
                      ));
                },
                isFill: true)),
      ],
    );
  }
}
