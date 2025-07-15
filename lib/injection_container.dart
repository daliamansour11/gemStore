import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'feature/home/data/api_service/remote_data_source/main_category_api.dart';
import 'feature/home/data/api_service/remote_data_source/product_apiService.dart';
import 'feature/home/data/home_repo_imp/featured_products_repo_imp.dart';
import 'feature/home/data/home_repo_imp/main_categories_repo_imp.dart';
import 'feature/home/data/home_repo_imp/recommended_products_repo_imp.dart';
import 'feature/home/domain/home_repo_interface/main_category_repo.dart';
import 'feature/home/domain/home_repo_interface/recommended_products_repo_interface.dart';
import 'feature/home/domain/home_usecases/get_featured_products_usecases.dart';
import 'feature/home/domain/home_usecases/get_main_categories_usecase.dart';
import 'feature/home/domain/home_usecases/get_recommended_products_usecase.dart';
import 'feature/home/presentation/Cubit/featured_products_cubit.dart';
import 'feature/home/presentation/Cubit/recommended_products_cubit.dart';
import 'feature/home/presentation/cubit/main_Categories_cubit.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  // API Service
  s1.registerSingleton<Dio>(Dio());

  // Featured Product API Service
  s1.registerSingleton<ProductApiService>(ProductApiService(s1()));

  //// Featured Products  REPOSITORY
  s1.registerSingleton<FeaturedProductsRepoImp>(FeaturedProductsRepoImp(s1()));

  // GetFeatured Products UseCase

  s1.registerSingleton<GetFeaturedProductsUseCase>(
      GetFeaturedProductsUseCase(s1()));

  //Featured Cubit (or Bloc)
  s1.registerSingleton<FeaturedProductsCubit>(
      FeaturedProductsCubit(s1())); // Products BLoC

////////////////////

  // Main Categories API Service
  s1.registerSingleton<MainCategoryApiService>(MainCategoryApiService(s1()));

  //// Featured Products  REPOSITORY
  s1.registerSingleton<MainCategoryRepositoryInterface>(
    MainCategoriesRepoImp(s1()),
  );
  // GetMain Categories UseCase

  s1.registerSingleton<GetMainCategoriesUseCase>(
      GetMainCategoriesUseCase(s1()));

  //Main Categories Cubit (or Bloc)
  s1.registerSingleton<MainCategoriesCubit>(MainCategoriesCubit(s1()));

  ///////////////////////
    // Recommended Products  REPOSITORY interface
  s1.registerSingleton<RecommendedProductsRepositoryInterface>(RecommendedProductsRepoImp(s1()));

  // GetRecommended Products UseCase

  s1.registerSingleton<GetRecommendedProductsUsecase>(
      GetRecommendedProductsUsecase(s1()));

  //Recommended products Cubit (or Bloc)
  s1.registerSingleton<RecommendedProductsCubit>(
      RecommendedProductsCubit(s1())); // Products BLoC

  
}
