

import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalytic {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static buttonClicked(String name){
    FirebaseAnalytic.analytics.logEvent(
      name: name,
      // parameters: {
      //   'button_name': 'Login',
      // },
    );
  }

  static  logScreenView(String screenName,String screenClass){

    FirebaseAnalytic.analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );

  }

}


