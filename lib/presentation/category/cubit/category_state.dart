import 'package:ecom_app4/data/category/model/category_model.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessfulState extends CategoryState {
  final List<CategoryModel> categories;
  CategorySuccessfulState(this.categories);
}

class CategoryFailedState extends CategoryState {
  final String errorMessage;
  CategoryFailedState(this.errorMessage);
}