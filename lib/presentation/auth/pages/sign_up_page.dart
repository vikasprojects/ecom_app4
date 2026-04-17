import 'package:ecom_app4/common/widgets/basic_app_bar.dart';
import 'package:ecom_app4/common/widgets/basic_app_button.dart';
import 'package:ecom_app4/core/config/navigator/app_navigator.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';
import 'package:ecom_app4/presentation/auth/pages/gender_and_age_selection_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  late UserCreateModel userCreateModel;
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignupScreen({super.key});

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
              _signupText(),
              SizedBox(height: 30,),
              _firstnameField(),
              SizedBox(height: 15,),
              _lastnameField(),
              SizedBox(height: 15,),
              _emailField(),
              SizedBox(height: 15,),
              _passwordField(),
              SizedBox(height: 15,),
              _continueButton(context),
              SizedBox(height: 15,),
              _alreadyHaveAcText()
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupText() {
    return Text("Sign up.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }

  Widget _firstnameField() {
    return TextField(
      decoration: InputDecoration(hintText: "Firstname"),
      controller: firstnameController,
    );
  }

  Widget _lastnameField() {
    return TextField(decoration: InputDecoration(hintText: "Lastname"),
      controller: lastnameController,);
  }

  Widget _emailField() {
    return TextField(decoration: InputDecoration(hintText: "Email"),
      controller: emailController,);
  }

  Widget _passwordField() {
    return TextField(decoration: InputDecoration(hintText: "Password"),
      controller: passwordController,);
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        userCreateModel = UserCreateModel(
          firstname: firstnameController.text, 
          lastname: lastnameController.text, 
          email: emailController.text, 
          password: passwordController.text
        );
        AppNavigator.push(context, GenderAndAgeSelectionPage(userCreateModel: userCreateModel,));
      },
      title: "Continue"
    );
  }

  Widget _alreadyHaveAcText() {
    return RichText(text: TextSpan(
      children: [
        TextSpan(
          text: "Already have an account? "
        ),
        TextSpan(
          text: "Create one",
          recognizer: TapGestureRecognizer()..onTap = () {
            
          }
        )
      ]
    ));
  }
}