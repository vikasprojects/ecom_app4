import 'package:ecom_app4/data/datasource/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final UserModel userModel;
  UserSuccessState(this.userModel);
}

class UserFailedState extends UserState {
  final String errorMessage;
  UserFailedState(this.errorMessage);
}