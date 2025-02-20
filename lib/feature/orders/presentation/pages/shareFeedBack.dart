import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import 'widgets/customAppBar.dart';
import 'widgets/custom_button.dart';
import 'widgets/feedback_popup.dart';

class ShareFeedBackScreen extends StatefulWidget {
  const ShareFeedBackScreen({super.key});

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
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(title: 'Share Your Feedback')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text('What is your opinion of GemStore?'),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: ratingRev,
                itemPadding: const EdgeInsets.all(8),
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
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      text: 'Send Feedback',
                      color: const Color(0xff343434),
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
              50.vs,
            ],
          ),
        ),
      ),
    );
  }
}
