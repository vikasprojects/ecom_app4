import 'package:ecom_app4/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:ecom_app4/injection.dart';
import 'package:ecom_app4/presentation/splash/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplashState());

  void appStarted() async {
    final isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      emit(AuthenticatedState());
    }
    else {
      emit(UnauthenticatedState());
    }
  }
}