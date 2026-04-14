import 'package:ecom_app4/domain/auth/usecase/get_ages_usecases.dart';
import 'package:ecom_app4/injection.dart';
import 'package:ecom_app4/presentation/auth/cubit/display_ages_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayAgesCubit extends Cubit<DisplayAgesState> {
  DisplayAgesCubit() : super(DisplayAgesLoadingState());

  void displayAges() async {
    final returnedData = await sl<GetAgesUsecases>().call();
    returnedData.fold(
      (errorMessage) {
        emit(DisplayAgesFailedState(errorMessage));
      }, 
      (ages) {
        emit(DisplayAgesLoadedState(ages));
      }
    );
  }
}