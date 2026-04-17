import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';
import 'package:ecom_app4/data/models/user_signin_request.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreateModel user);
  Future<Either> getAges();
  Future<Either> signIn(UserSigninRequest userSignInReq);
}