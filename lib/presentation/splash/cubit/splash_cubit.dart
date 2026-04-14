import 'package:ecom_app4/presentation/splash/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplashState());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 1));
    emit(UnauthenticatedState());
  }
}