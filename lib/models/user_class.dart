import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String userName;
  final String userInitials;
  final String userPassword;
  final String group;
  final String colour;
  bool? isPasswordCorrect;

  User({
    required this.userName,
    required this.userInitials,
    required this.userPassword,
    required this.group,
    required this.colour,
    this.isPasswordCorrect
}){
    isPasswordCorrect = isPasswordCorrect ?? false;
  }

  User copyWith({
    String? userName,
    String? userInitials,
    String? userPassword,
    String? group,
    String? colour,
    bool? isDeleted,
}){
    return User(
      userName: userName ?? this.userName,
      userInitials: userInitials ?? this.userInitials,
      userPassword: userPassword ?? this.userPassword,
      group: group ?? this.group,
      colour: colour ?? this.colour,
      isPasswordCorrect: isPasswordCorrect ?? this.isPasswordCorrect,
    );
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      userName: map['userName'] ?? '',
      userInitials: map['userInitials'] ?? '',
      userPassword: map['userPassword'] ?? '',
      group: map['group'] ?? '',
      colour: map['colour'] ?? '',
      isPasswordCorrect: map['isPasswordCorrect'],

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    userName,userInitials,userPassword,isPasswordCorrect
  ];

}