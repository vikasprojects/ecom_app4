import 'package:ecom_app4/common/widgets/app_bottomsheet.dart';
import 'package:ecom_app4/core/config/theme/app_color.dart';
import 'package:ecom_app4/presentation/auth/cubit/age_selection_cubit.dart';
import 'package:ecom_app4/presentation/auth/cubit/display_ages_cubit.dart';
import 'package:ecom_app4/presentation/auth/cubit/gender_selection_cubit.dart';
import 'package:ecom_app4/presentation/auth/widget/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => DisplayAgesCubit()..displayAges())
        ],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20), 
            child: Column(
              children: [
                _tellUsAboutYourself(),
                _genderWidget(),
                SizedBox(height: 20,),
                _ages()
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _tellUsAboutYourself() {
    return Text("Tell us about yourself", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }

  Widget _genderWidget() {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            _genderTile(context, 0, "Men", state),
            _genderTile(context, 1, "Women", state)
          ],
        );
      },
    );
  }

  Widget _genderTile(BuildContext context, int genderIndex, String genderTitle, int selectedGender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().changeGender(genderIndex);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            color: selectedGender == genderIndex ? AppColor.primary : AppColor.background
          ),
          child: Text(genderTitle),
        ),
      )
    );
  }

  Widget _ages() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  AppBottomsheet.showBottomSheet(
                    context, 
                    MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: context.read<DisplayAgesCubit>()),
                        BlocProvider.value(value: context.read<AgeSelectionCubit>()) 
                      ], 
                      child: Ages()
                    )
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: AppColor.secondaryBackground,
                  child: Text(state),
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
