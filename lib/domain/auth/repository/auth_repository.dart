import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreateModel user);
}