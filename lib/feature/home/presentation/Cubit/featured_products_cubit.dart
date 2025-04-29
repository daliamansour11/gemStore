import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/data_state.dart';
import '../../../../core/network/error/error_handle.dart';
import '../../domain/home_entities/featured_products_entity.dart';
import '../../domain/home_usecases/get_featured_products_usecases.dart';
part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  final GetFeaturedProductsUseCase _getFeaturedProductsUseCase;

  FeaturedProductsCubit(this._getFeaturedProductsUseCase)
      : super(FeaturedProductsInitial());

  Future<void> fetchFeaturedProducts() async {
    try {
safeEmit(FeaturedProductsLoading());
      final dataState = await _getFeaturedProductsUseCase();

      if (dataState is DataSuccess<List<FeaturedProductsEntity>> &&
          dataState.data != null) {
        print('responsefromApiiiiiiiiiiiiiii: ${dataState.data}');
        safeEmit(FeaturedProductsLoaded(dataState.data!));


      } else if (dataState is DataFailed) {
        print('errorrrrrrrrrrrr: ${dataState.error!.message}');
        final errorMessage = getErrorMessage(dataState.error!);
        safeEmit(FeaturedProductsError(errorMessage));
      }
    } catch (e) {
      print('errorrrrrrrrrrrr44444444: ${e}');

    }
  }
  void safeEmit(FeaturedProductsState state) {
    if (!isClosed) emit(state);
  }

}