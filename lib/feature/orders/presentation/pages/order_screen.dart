import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/global.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../cubit/order_cubit.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Global.analytics.logScreenView(
      screenName: 'OrdersScreen',
      screenClass: 'OrdersScreen',
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorsManger.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: Column(
            children: [
              customAppBarWidget(
                  context: context,
                  title: AppString.myOrders,
                  isBackable: false),
              const Expanded(child: CustomOrdersTabBar()),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => OrdersCubit()..fetchOrders(),
          child: const TabBarView(
            children: [
              OrdersList(status: AppString.pending),
              OrdersList(status: AppString.delivered),
              OrdersList(status: AppString.cancelled),
            ],
          ),
        ),
      ),
    );
  }
}
