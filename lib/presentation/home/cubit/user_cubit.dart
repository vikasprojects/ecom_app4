import 'package:ecom_app4/domain/home/usecase/get_user_usecase.dart';
import 'package:ecom_app4/injection.dart';
import 'package:ecom_app4/presentation/home/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  Future<void> getUser() async {
    emit(UserLoadingState());
    try {
      final user = await sl<GetUserUsecase>().call();
      user.fold((error) {
        emit(UserFailedState(error));
      }, 
      (user) {
        emit(UserSuccessState(user));
      });
    }
    catch (e) {
      emit(UserFailedState("Error : $e"));
    }
  }
}