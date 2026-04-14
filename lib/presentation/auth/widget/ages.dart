import 'package:ecom_app4/presentation/auth/cubit/age_selection_cubit.dart';
import 'package:ecom_app4/presentation/auth/cubit/display_ages_cubit.dart';
import 'package:ecom_app4/presentation/auth/cubit/display_ages_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayAgesCubit, DisplayAgesState>(
      builder: (context, state) {
        if (state is DisplayAgesLoadingState) {
          return Center(child: CircularProgressIndicator(),);
        }
        else if (state is DisplayAgesFailedState) {
          return Center(child: Text(state.errorMessage));
        }
        else if (state is DisplayAgesLoadedState) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final age = state.ages[index].data()['value'];
                return GestureDetector(onTap: () {
                  context.read<AgeSelectionCubit>().changeAge(age);
                  Navigator.pop(context);
                }, child: ListTile(title:  Text(age),));
              },
              itemCount: state.ages.length,
            ),
          );
        }
        return Container();
      },
    );
  }
}