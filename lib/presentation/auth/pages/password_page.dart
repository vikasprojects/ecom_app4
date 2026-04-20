import 'package:ecom_app4/common/bloc/button_cubit.dart';
import 'package:ecom_app4/common/widgets/basic_app_bar.dart';
import 'package:ecom_app4/common/widgets/basic_app_button.dart';
import 'package:ecom_app4/common/widgets/basic_reactive_button.dart';
import 'package:ecom_app4/core/config/navigator/app_navigator.dart';
import 'package:ecom_app4/data/auth/models/user_signin_request.dart';
import 'package:ecom_app4/domain/auth/usecase/sign_in_usecase.dart';
import 'package:ecom_app4/presentation/auth/pages/forgot_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordPage extends StatelessWidget {
  UserSigninRequest userSigninRequest;
  final _passwordController = TextEditingController();
  PasswordPage({super.key, required this.userSigninRequest});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: Scaffold(
        appBar: BasicAppBar(isHideBack: false, context: context,),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signInText(),
                SizedBox(height: 30,),
                _passwordField(),
                SizedBox(height: 15,),
                _signInButton(context),
                SizedBox(height: 15,),
                _forgotPassword(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return Text("Sign in.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(hintText: "Enter Password")
    );
  }

  Widget _signInButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            userSigninRequest.password = _passwordController.text;
            context.read<ButtonCubit>().execute(usecase: SignInUsecase(), params: userSigninRequest);
          }, 
          title: "Sign in"
        );
      }
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: "Forgot password? "
        ),
        TextSpan(
          text: "Reset",
          recognizer: TapGestureRecognizer()..onTap = () {
            AppNavigator.push(context, ForgotPasswordPage());
          }
        )
      ]
    ));
  }
}