import 'package:dartz/dartz.dart';
import 'package:ecom_app4/common/usecase/usecase.dart';
import 'package:ecom_app4/domain/category/domain/category_repository.dart';
import 'package:ecom_app4/injection.dart';

class GetCategoryUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}