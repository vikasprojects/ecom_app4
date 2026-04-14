import 'package:ecom_app4/common/widgets/basic_app_bar.dart';
import 'package:ecom_app4/common/widgets/basic_app_button.dart';
import 'package:ecom_app4/core/config/navigator/app_navigator.dart';
import 'package:ecom_app4/presentation/auth/pages/forgot_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _signInButton(),
              SizedBox(height: 15,),
              _forgotPassword(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return Text("Sign in.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }

  Widget _passwordField() {
    return TextField(decoration: InputDecoration(hintText: "Enter Password"),);
  }

  Widget _signInButton() {
    return BasicAppButton(onPressed: () {}, title: "Sign in");
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: "Forgot password?  "
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