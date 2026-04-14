import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/datasource/auth_datasource.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:ecom_app4/injection.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(UserCreateModel user) async {
    return await sl<AuthDatasource>().signUp(user);
  }
}