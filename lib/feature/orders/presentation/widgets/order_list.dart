import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/order_cubit.dart';
import '../cubit/order_states.dart';
import 'order_card.dart';

class OrdersList extends StatelessWidget {
  final String status;

  const OrdersList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is OrdersLoaded) {
          final orders =
              state.orders.where((order) => order.status == status).toList();
          if (orders.isEmpty) {
            return const Center(child: Text('No orders available'));
          }
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) => OrderCard(order: orders[index]),
          );
        } else {
          return const Center(child: Text('Failed to load orders'));
        }
      },
    );
  }
}
