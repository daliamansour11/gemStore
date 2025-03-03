import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/resources/strings_manger.dart';
import '../../../../../core/widget/custom_button.dart';
import 'feedback_popup.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({super.key});

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}
double ratingRev = 4.0;
final TextEditingController reviewController = TextEditingController();

class _FeedbackWidgetState extends State<FeedbackWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const Text(AppString.userFeedBackStr),
        const SizedBox(height: 10),
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
        const Spacer(),
        SizedBox(
            width: double.infinity,
            child: CustomButton(
                text: AppString.sendFeedBackBtn,
                color:  ColorsManger.btnColor,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: FeedbackPopup(
                        onDonePressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
                isFill: true)),
        50.vs,
      ],
    );
  }
}
