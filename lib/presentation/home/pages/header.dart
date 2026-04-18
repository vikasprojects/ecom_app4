import 'package:ecom_app4/presentation/home/cubit/user_cubit.dart';
import 'package:ecom_app4/presentation/home/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUser(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is UserFailedState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          else if (state is UserSuccessState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profilePic(),
                _gender(),
                _shoping()
              ],
            );
          }
          return SizedBox();
        }
      )
    );
  }

  Widget _profilePic() {
    return Container(
      height: 30,
      width: 30,
      color: Colors.red,
    );
  }

  Widget _gender() {
    return Container(
      height: 30,
      width: 30,
      color: Colors.red,
    );
  }

  Widget _shoping() {
    return Container(
      height: 30,
      width: 30,
      color: Colors.red,
    );
  }
}