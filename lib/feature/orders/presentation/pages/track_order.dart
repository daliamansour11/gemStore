import 'package:flutter/material.dart';
import '../../../../core/global/global.dart';
import 'widgets/trace_order_widget.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';


class OrderTrack extends StatelessWidget {
  const OrderTrack({super.key});

  @override
  Widget build(BuildContext context) {


    Global.logScreenView('OrderTrack', 'OrderTrack');

    return Scaffold(
      appBar: customAppBar(title: AppString.traceOrderAppBar, context: context,  isBackable: true, haveActions: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:TraceOrderWidget(),
      ),
    );
  }
}

