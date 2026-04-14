import 'package:ecom_app4/common/widgets/basic_app_bar.dart';
import 'package:ecom_app4/common/widgets/basic_app_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(isHideBack: false, context: context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _forgotPasswordText(),
              SizedBox(height: 30,),
              _emailField(),
              SizedBox(height: 15,),
              _resetPasswordButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordText() {
    return Text("Forgot password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
  }

  Widget _emailField() {
    return TextField(decoration: InputDecoration(hintText: "Enter Email"),);
  }

  Widget _resetPasswordButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        // AppNavigator.push(context, PasswordPage());
      }, 
      title: "Reset"
    );
  }
}