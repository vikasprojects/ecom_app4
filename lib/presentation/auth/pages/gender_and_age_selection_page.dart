import 'package:ecom_app4/common/bloc/button_cubit.dart';
import 'package:ecom_app4/common/bloc/button_state.dart';
import 'package:ecom_app4/common/widgets/app_bottomsheet.dart';
import 'package:ecom_app4/common/widgets/basic_reactive_button.dart';
import 'package:ecom_app4/core/config/theme/app_color.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';
import 'package:ecom_app4/domain/auth/usecase/sign_up_usecase.dart';
import 'package:ecom_app4/presentation/auth/cubit/age_selection_cubit.dart';
import 'package:ecom_app4/presentation/auth/cubit/display_ages_cubit.dart';
import 'package:ecom_app4/presentation/auth/cubit/gender_selection_cubit.dart';
import 'package:ecom_app4/presentation/auth/widget/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  UserCreateModel userCreateModel;
  GenderAndAgeSelectionPage({super.key, required this.userCreateModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => DisplayAgesCubit()..displayAges()),
          BlocProvider(create: (context) => ButtonCubit())
        ],
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            
          },
          child: 
             SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20), 
                child: Column(
                  children: [
                    _tellUsAboutYourself(),
                    _genderWidget(),
                    SizedBox(height: 20,),
                    _ages(),
                    _finishButton(context)
                  ],
                )
              ),
            )
          
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

  Widget _finishButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          title: "Sign Up.", 
          onPressed: () {
            userCreateModel.gender = context.read<GenderSelectionCubit>().state;
            userCreateModel.age = context.read<AgeSelectionCubit>().state;
            context.read<ButtonCubit>().execute(usecase: SignUpUsecase(), params: userCreateModel);
          },
        );
      }
    );
  }
}
