import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/customAppBar.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/custom_button.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/feedback_popup.dart';

class ShareFeedBackScreen extends StatefulWidget {
  const ShareFeedBackScreen({Key? key}) : super(key: key);

  @override
  _ShareFeedBackScreenState createState() => _ShareFeedBackScreenState();
}

class _ShareFeedBackScreenState extends State<ShareFeedBackScreen> {
  double ratingRev = 4.0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: "Share Your Feedback")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text("What is your opinion of GemStore?"),
              const SizedBox(height: 10),
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
              Spacer(),
              SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      text: "Send Feedback",
                      color: Color(0xff343434),
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
                      isfill: true)),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
