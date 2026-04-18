// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String userId;
  final String firstname;
  final String lastname;
  final String email;
  final String image;
  final int gender;

  UserModel({
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.image,
    required this.gender,
  });

  

  UserModel copyWith({
    String? userId,
    String? firstname,
    String? lastname,
    String? email,
    String? image,
    int? gender,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      image: image ?? this.image,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'image': image,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userId: $userId, firstname: $firstname, lastname: $lastname, email: $email, image: $image, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.email == email &&
      other.image == image &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      email.hashCode ^
      image.hashCode ^
      gender.hashCode;
  }
}

extension UserXModel on UserModel {
  UserModel toEntity() {
    return UserModel(userId: userId, firstname: firstname, lastname: lastname, email: email, image: image, gender: gender);
  }
}