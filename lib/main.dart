import 'package:ecom_app4/core/config/theme/app_theme.dart';
import 'package:ecom_app4/presentation/splash/cubit/splash_cubit.dart';
import 'package:ecom_app4/presentation/splash/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: BlocProvider(
        create: (context) => SplashCubit()..appStarted(),
        child: SplashScreen(),
      )
    );
  }
}