import 'package:ecom_app4/core/config/theme/app_color.dart';
import 'package:ecom_app4/presentation/auth/cubit/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenderSelectionCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20), 
            child: Column(
              children: [
                _tellUsAboutYourself(),
                SizedBox(height: 20,),
                _genderSelection()
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

  Widget _genderSelection() {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            _genderTile(context, 0, "Men"),
            SizedBox(width: 10,),
            _genderTile(context, 1, "Women")
          ],
        );
    });
  }

  Widget _genderTile(BuildContext context, int genderIndex, String genderTitle) {
    return Builder(
      builder: (context) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              context.read<GenderSelectionCubit>().changeGender(genderIndex);
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.read<GenderSelectionCubit>().selectedGender == genderIndex ? AppColor.primary : AppColor.background
              ),
              child: Text(genderTitle),
            ),
          )
        );
      }
    );
  }
}
