import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DisplayAgesState {}

class DisplayAgesLoadingState extends DisplayAgesState {}

class DisplayAgesLoadedState extends DisplayAgesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;
  DisplayAgesLoadedState(this.ages);
}

class DisplayAgesFailedState extends DisplayAgesState {
  final String errorMessage;
  DisplayAgesFailedState(this.errorMessage);
}