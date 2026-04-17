import 'package:ecom_app4/common/widgets/basic_app_bar.dart';
import 'package:ecom_app4/common/widgets/basic_app_button.dart';
import 'package:ecom_app4/core/config/navigator/app_navigator.dart';
import 'package:ecom_app4/data/models/user_signin_request.dart';
import 'package:ecom_app4/presentation/auth/pages/password_page.dart';
import 'package:ecom_app4/presentation/auth/pages/sign_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  late UserSigninRequest userSigninRequest;
  final _emailController = TextEditingController();
  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(isHideBack: true, context: context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signInText(),
              SizedBox(height: 30,),
              _emailField(),
              SizedBox(height: 15,),
              _continueButton(context),
              SizedBox(height: 15,),
              _alreadyHaveAcText(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return Text("Sign in.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(hintText: "Enter Email"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        userSigninRequest = UserSigninRequest(email: _emailController.text);
        AppNavigator.push(context, PasswordPage(userSigninRequest: userSigninRequest));
      }, 
      title: "Continue"
    );
  }

  Widget _alreadyHaveAcText(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: "Already have an account? "
        ),
        TextSpan(
          text: "Create one",
          recognizer: TapGestureRecognizer()..onTap = () {
            AppNavigator.push(context, SignupScreen());
          }
        )
      ]
    ));
  }
}