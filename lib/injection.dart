import 'package:ecom_app4/data/datasource/auth_datasource.dart';
import 'package:ecom_app4/data/repository/auth_repository_impl.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependency() async {
  sl.registerSingleton<AuthDatasource>(AuthDatasourceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  
}