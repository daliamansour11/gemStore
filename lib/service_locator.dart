import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../core/api/api_consumer.dart';
import '../core/api/dio_consumer.dart';
import 'feature/Auth/data/datasource/auth_remote_data_source.dart';
import 'feature/Auth/data/repository/auth_repository_impl.dart';
import 'feature/Auth/domain/repository/auth_repository.dart';
import 'feature/Auth/domain/usecases/login_usecase.dart';
import 'feature/Auth/presentation/cubit/api_cubit_cubit.dart';

final s1 = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio
  if (!s1.isRegistered<Dio>()) {
    s1.registerSingleton<Dio>(Dio());
  }

  // DioConsumer
  if (!s1.isRegistered<ApiConsumer>()) {
    s1.registerSingleton<ApiConsumer>(DioConsumer(dio: s1<Dio>()));
  }

  // Remote Data Source
  if (!s1.isRegistered<AuthRemoteDataSource>()) {
    s1.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(api: s1<ApiConsumer>()),
    );
  }

  // Repository
  if (!s1.isRegistered<AuthRepository>()) {
    s1.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(remoteDataSource: s1<AuthRemoteDataSource>()),
    );
  }

  // UseCase
  if (!s1.isRegistered<LoginUseCase>()) {
    s1.registerSingleton<LoginUseCase>(
      LoginUseCase(repository: s1<AuthRepository>()),
    );
  }

  // Cubit
  if (!s1.isRegistered<AuthCubit>()) {
    s1.registerSingleton<AuthCubit>(
      AuthCubit(s1<LoginUseCase>()),
    );
  }
}
