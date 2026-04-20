import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class CategoryDatasource {
  Future<Either> getCategories();
}

class CategoryDatasourceImpl extends CategoryDatasource {
  @override
  Future<Either> getCategories() async {
    try {
      final returnedData = await FirebaseFirestore.instance.collection("categories").get();
      final categories = returnedData.docs.map((e) => e.data()).toList();
      return Right(categories);
    }
    on FirebaseException catch (e) {
      return Left(e.message);
    }
  }
}