import 'package:flutter/material.dart';
import '../../../../core/firebase_analytics/firebase_analytic.dart';
import 'widgets/feedback_widget.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';


class ShareFeedBackScreen extends StatefulWidget {
  const ShareFeedBackScreen({super.key});

  @override
  _ShareFeedBackScreenState createState() => _ShareFeedBackScreenState();
}

class _ShareFeedBackScreenState extends State<ShareFeedBackScreen> {

  @override
  Widget build(BuildContext context) {

    FirebaseAnalytic.logScreenView('ShareFeedBackScreen', 'ShareFeedBackScreen');

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(title: AppString.feedBackAppBar, context: context,  isBackable: true, haveActions: false),

        body: Padding(
          padding: 20.ph,
          child:const FeedbackWidget()
        ),
      ),
    );
  }
}
