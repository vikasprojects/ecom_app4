import 'package:ecom_app4/common/bloc/button_cubit.dart';
import 'package:ecom_app4/common/bloc/button_state.dart';
import 'package:ecom_app4/domain/auth/usecase/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicReactiveButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  const BasicReactiveButton({super.key, required this.title, required this.onPressed});

  @override
  State<BasicReactiveButton> createState() => _BasicReactiveButtonState();
}

class _BasicReactiveButtonState extends State<BasicReactiveButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loading();
        }
        return _initial();
      }
    );
  }

  Widget _loading() {
    return ElevatedButton(onPressed: () {
      context.read<ButtonCubit>().execute(usecase: SignUpUsecase(), );
    }, child: Center( child: CircularProgressIndicator(),));
  }

  Widget _initial() {
    return ElevatedButton(onPressed: widget.onPressed, child: Text("Sign up"));
  }
}