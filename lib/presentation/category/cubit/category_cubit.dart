import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/category/usecase/get_category_usecase.dart';
import 'package:ecom_app4/injection.dart';
import 'package:ecom_app4/presentation/category/cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());

  void getCategories() async {
    try {
      final returnData = await sl<GetCategoryUsecase>().call();
      returnData.fold(
        (errorMessage) {
          emit(CategoryFailedState(errorMessage)) ;
        },
        (data) {
          emit(CategorySuccessfulState(data));
        }
      );
    }
    catch (e) {
      emit(CategoryFailedState(e.toString()));
    }
  }
}