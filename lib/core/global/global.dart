

  import 'package:firebase_analytics/firebase_analytics.dart';

class Global {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static buttonClicked(String name){
     Global.analytics.logEvent(
       name: name,
       // parameters: {
       //   'button_name': 'Login',
       // },
     );
   }

  static  logScreenView(String screenName,String screenClass){

     Global.analytics.logScreenView(
       screenName: screenName,
       screenClass: screenClass,
     );

   }

  }


