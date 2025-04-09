import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// class FirebaseAnalytic {
//   //TODO: Add this file in services folder >>>>>>>>>>>>>>>>>>>Done(by reema)
//   static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

//   static buttonClicked(String name) {
//     FirebaseAnalytic.analytics.logEvent(
//       name: name,
//       // parameters: {
//       //   'button_name': 'Login',
//       // },
//     );
//   }

//   static logScreenView(String screenName, String screenClass) {
//     FirebaseAnalytic.analytics.logScreenView(
//       screenName: screenName,
//       screenClass: screenClass,
//     );
//   }

//   void logOrderDetails(
//     String userId,
//     String orderId,
//     DateTime orderDate,
//   ) {
//     FirebaseAnalytic.setUserIdentifier(userId);
//     FirebaseAnalytic.instance.setCustomKey('order_id', orderId);
//     FirebaseAnalytic.instance
//         .setCustomKey('order_date', orderDate.toIso8601String());

//     // Optional: add a breadcrumb-style log
//     FirebaseAnalytic.instance
//         .log('Order placed: $orderId by $userId on $orderDate');
//   }
// }
class FirebaseAnalytic {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  static void buttonClicked(String name) {
    analytics.logEvent(name: name);
  }

  static void logScreenView(String screenName, String screenClass) {
    analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }

  static void logOrderDetails(
    String userId,
    String orderId,
    DateTime orderDate,
  ) {
    crashlytics.setUserIdentifier(userId);
    crashlytics.setCustomKey('order_id', orderId);
    crashlytics.setCustomKey('order_date', orderDate.toIso8601String());
    crashlytics.log('Order placed: $orderId by $userId on $orderDate');
  }
}
