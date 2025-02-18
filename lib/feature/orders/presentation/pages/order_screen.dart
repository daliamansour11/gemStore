import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorsManger.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(118.h),
          child: Column(
            children: [
              customAppBarWidget(
                  context: context,
                  title: AppString.myOrders,
                  isBackable: false),
              const CustomOrdersTabBar(),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => OrdersCubit()..fetchOrders(),
          child: const TabBarView(
            children: [
              OrdersList(status: 'Pending'),
              OrdersList(status: 'Delivered'),
              OrdersList(status: 'Cancelled'),
            ],
          ),
        ),
      ),
    );
  }
}
