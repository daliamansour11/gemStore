import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_usecase.dart';
import 'api_cubit_state.dart';
import '../../../../core/services/cache_helper.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthCubit(this.loginUseCase) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await loginUseCase.call(email, password);

      // ✅ حفظ التوكن بعد تسجيل الدخول
      await CacheHelper.saveData(key: 'token', value: result.accessToken);

      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
