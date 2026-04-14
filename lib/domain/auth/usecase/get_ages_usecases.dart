import 'package:dartz/dartz.dart';
import 'package:ecom_app4/common/usecase/usecase.dart';
import 'package:ecom_app4/domain/auth/repository/auth_repository.dart';
import 'package:ecom_app4/injection.dart';

class GetAgesUsecases extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getAges();
  }
}