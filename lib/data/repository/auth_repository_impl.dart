import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/datasource/auth_datasource.dart';
import 'package:ecom_app4/data/datasource/user_model.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';
import 'package:ecom_app4/data/models/user_signin_request.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:ecom_app4/injection.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(UserCreateModel user) async {
    return await sl<AuthDatasource>().signUp(user);
  }
  
  @override
  Future<Either<dynamic, dynamic>> getAges() async {
    return await sl<AuthDatasource>().getAges();
  }

  @override
  Future<Either> signIn(UserSigninRequest userSignInReq) async {
    return await sl<AuthDatasource>().signIn(userSignInReq);
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthDatasource>().isLoggedIn();
  }
  
  @override
  Future<Either> getUser() async {
    final user = await sl<AuthDatasource>().getUser();
    return user.fold(
      (error) {
        return Left(error);
      }, 
      (data) {
        return Right(UserModel.fromMap(data).toEntity());
      }
    );
  }
}