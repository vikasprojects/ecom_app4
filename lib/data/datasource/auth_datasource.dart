import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_app4/data/models/user_create_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<Either> signUp(UserCreateModel user);
  Future<Either> getAges();
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
}