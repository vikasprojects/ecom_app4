import 'package:ecom_app4/core/config/theme/app_color.dart';
import 'package:ecom_app4/presentation/category/cubit/category_cubit.dart';
import 'package:ecom_app4/presentation/category/cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          else if (state is CategoryFailedState) {
            return Text(state.errorMessage);
          }
          else if (state is CategorySuccessfulState) {
            return SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20,);
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return Container(
                    color: AppColor.secondaryBackground,
                    child: Column(
                      children: [
                        Image.asset('assets/images/${state.categories[index].image}', height: 30, width: 30,),
                        Text(category.title)
                      ],
                    ),
                  );
                },
                itemCount: state.categories.length,
              ),
            );
          }
          return Text("asdf");
        }
      ),
    );
  }
}
