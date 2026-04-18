import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';
import 'package:ecom_app4/data/models/user_signin_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<Either> signUp(UserCreateModel user);
  Future<Either> getAges();
  Future<Either> signIn(UserSigninRequest userSignInReq);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthDatasourceImpl extends AuthDatasource {
  @override
  Future<Either> signUp(UserCreateModel user) async {
    try {
      final returnedData = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password);
      await FirebaseFirestore.instance.collection("users").doc(returnedData.user!.uid).set({
        'firstname': user.firstname,
        'lastname': user.lastname,
        'email': user.email,
        'password': user.password,
        'gender': user.gender,
        'age': user.age
      });
      return Right('Sign up successful');
    }
    on FirebaseException catch (e) {
      return Left('Error : ${e.message}');
    }
  }
  
  @override
  Future<Either> getAges() async {
    try {
      final returnedData = await FirebaseFirestore.instance.collection("ages").get();
      return Right(returnedData.docs);
    }
    on FirebaseException catch (e) {
      return Left(e.message);
    }
  }
  
  @override
  Future<Either> signIn(UserSigninRequest userSignInReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: userSignInReq.email, password: userSignInReq.password!);
      return Right("Sign in successful");
    }
    on FirebaseException catch (e) {
      return Left("Error : ${e.message}");
    }
  }
  
  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    else {
      return false;
    }
  }
  
  @override
  Future<Either> getUser() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final returnturnedData = await FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).get();
      return Right(returnturnedData);
    }
    on FirebaseException catch (e) {
      return Left("Error : ${e.code}");
    }
  }
}