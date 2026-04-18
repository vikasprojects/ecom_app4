import 'package:ecom_app4/data/datasource/auth_datasource.dart';
import 'package:ecom_app4/data/repository/auth_repository_impl.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:ecom_app4/domain/auth/usecase/get_ages_usecases.dart';
import 'package:ecom_app4/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependency() async {
  sl.registerSingleton<AuthDatasource>(AuthDatasourceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<GetAgesUsecases>(GetAgesUsecases());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
}