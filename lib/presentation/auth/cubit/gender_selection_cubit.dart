import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(0);

  void changeGender(int genderIndex) {
    emit(genderIndex);
  }
}