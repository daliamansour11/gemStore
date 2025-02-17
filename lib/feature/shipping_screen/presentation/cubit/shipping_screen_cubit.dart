import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shipping_screen_state.dart';

class ShippingScreenCubit extends Cubit<ShippingScreenState> {
  ShippingScreenCubit() : super(ShippingScreenInitial());
}
