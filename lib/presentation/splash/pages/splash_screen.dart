import 'package:ecom_app4/core/config/assets/app_vectors.dart';
import 'package:ecom_app4/core/config/theme/app_color.dart';
import 'package:ecom_app4/presentation/auth/pages/sign_in_page.dart';
import 'package:ecom_app4/presentation/splash/cubit/splash_cubit.dart';
import 'package:ecom_app4/presentation/splash/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnauthenticatedState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Center(
          child: SvgPicture.asset(AppVectors.logo),
        ),
      ),
    );
  }
}