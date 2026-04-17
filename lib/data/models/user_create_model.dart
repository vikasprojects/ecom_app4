// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserCreateModel {
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  int? gender;
  String? age;

  UserCreateModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    this.gender,
    this.age
  });

  UserCreateModel copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    int? gender,
    String? age,
  }) {
    return UserCreateModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'gender': gender,
      'age': age,
    };
  }

  factory UserCreateModel.fromMap(Map<String, dynamic> map) {
    return UserCreateModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      gender: map['gender'] != null ? map['gender'] as int : null,
      age: map['age'] != null ? map['age'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCreateModel.fromJson(String source) => UserCreateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserCreateModel(firstname: $firstname, lastname: $lastname, email: $email, password: $password, gender: $gender, age: $age)';
  }

  @override
  bool operator ==(covariant UserCreateModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.email == email &&
      other.password == password &&
      other.gender == gender &&
      other.age == age;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
      lastname.hashCode ^
      email.hashCode ^
      password.hashCode ^
      gender.hashCode ^
      age.hashCode;
  }
}
