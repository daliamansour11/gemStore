import 'package:flutter/material.dart';
import '../../../../../core/services/firebase_analytic.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import 'widgets/trace_order_widget.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';

class OrderTrack extends StatelessWidget {
  const OrderTrack({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytic.logScreenView('OrderTrack', 'OrderTrack');

    return Scaffold(
      appBar: customAppBar(
          title: AppString.traceOrderAppBar,
          context: context,
          isBackable: true,
          haveActions: false),
      body: Padding(
        padding: 20.ph,
        child: TraceOrderWidget(),
      ),
    );
  }
}
