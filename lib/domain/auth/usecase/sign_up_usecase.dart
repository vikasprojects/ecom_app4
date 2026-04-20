import 'package:dartz/dartz.dart';
import 'package:ecom_app4/common/usecase/usecase.dart';
import 'package:ecom_app4/data/auth/models/user_create_model.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:ecom_app4/injection.dart';

class SignUpUsecase extends Usecase<Either, UserCreateModel> {
  @override
  Future<Either> call({UserCreateModel? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }
}