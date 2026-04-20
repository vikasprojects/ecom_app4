import 'package:ecom_app4/data/auth/datasource/auth_datasource.dart';
import 'package:ecom_app4/data/auth/repository/auth_repository_impl.dart';
import 'package:ecom_app4/data/category/datasource/category_datasource.dart';
import 'package:ecom_app4/data/category/repository/category_repository_impl.dart';
import 'package:ecom_app4/data/category/usecase/get_category_usecase.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:ecom_app4/domain/auth/usecase/get_ages_usecases.dart';
import 'package:ecom_app4/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:ecom_app4/domain/category/domain/category_repository.dart';
import 'package:ecom_app4/domain/home/usecase/get_user_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependency() async {
  sl.registerSingleton<AuthDatasource>(AuthDatasourceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<GetAgesUsecases>(GetAgesUsecases());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());

  
  sl.registerSingleton<CategoryDatasource>(CategoryDatasourceImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<GetCategoryUsecase>(GetCategoryUsecase());
}