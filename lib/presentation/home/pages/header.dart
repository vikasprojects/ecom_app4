import 'package:ecom_app4/presentation/home/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _profilePic(),
              _gender(),
              _shoping()
            ],
          ),
        ),
      ),
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