import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../domain/entity/order_entity.dart';
import 'order_states.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void fetchOrders() async {
    emit(OrdersLoading());

    await Future.delayed(const Duration(seconds: 2));

    final List<Order> orders = [
      Order(
        id: 1524,
        trackingNumber: 'IK287368838',
        date: '13/05/2021',
        quantity: 2,
        subtotal: 110,
        status: 'Pending',
        color: ColorsManger.pending,
      ),
      Order(
        id: 1524,
        trackingNumber: 'IK2873218897',
        date: '12/05/2021',
        quantity: 3,
        subtotal: 230,
        status: 'Pending',
        color: ColorsManger.pending,
      ),
      Order(
        id: 1524,
        trackingNumber: 'IK237368820',
        date: '10/05/2021',
        quantity: 5,
        subtotal: 490,
        status: 'Pending',
        color: ColorsManger.pending,
      ),
      Order(
        id: 1524,
        trackingNumber: 'IK287368837',
        date: '15/05/2021',
        quantity: 1,
        subtotal: 50,
        status: 'Delivered',
        color: ColorsManger.delivered,
      ),
      Order(
        id: 1524,
        trackingNumber: 'IK237368831',
        date: '08/05/2021',
        quantity: 4,
        subtotal: 320,
        status: 'Cancelled',
        color: ColorsManger.canceled,
      ),
    ];

    emit(OrdersLoaded(orders));
  }
}
