import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/category/datasource/category_datasource.dart';
import 'package:ecom_app4/data/category/model/category_model.dart';
import 'package:ecom_app4/domain/category/domain/category_repository.dart';
import 'package:ecom_app4/injection.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    try {
      final returnedCategories = await sl<CategoryDatasource>().getCategories();
      return returnedCategories.fold(
        (error) {
          return Left(error);
        }, 
        (categoriesMap) {
          final categories = List.from(categoriesMap).map((e) => CategoryModel.fromMap(e)).toList();
          return Right(categories);
        }
      );
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}