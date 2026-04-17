import 'package:dartz/dartz.dart';
import 'package:ecom_app4/common/bloc/button_state.dart';
import 'package:ecom_app4/common/usecase/usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required Usecase usecase}) async {
    try {
      emit(ButtonLoadingState());
      Either returnedData = await usecase.call(params: params);
      returnedData.fold(
        (errorMessage) {
          emit(ButtonFailedState());
        },
        (data) {
          emit(ButtonLoadedState());
        }
      );
    }
    on FirebaseException catch (e) {
      emit(ButtonFailedState());
    }
  }
}