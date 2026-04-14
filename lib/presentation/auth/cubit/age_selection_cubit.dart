import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super("Age range");

  void changeAge(String age) {
    emit(age);
  }
}