import 'package:dartz/dartz.dart';
import 'package:ecom_app4/common/usecase/usecase.dart';
import 'package:ecom_app4/data/auth/models/user_signin_request.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:ecom_app4/injection.dart';

class SignInUsecase extends Usecase<Either, UserSigninRequest> {
  @override
  Future<Either> call({UserSigninRequest? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }
}