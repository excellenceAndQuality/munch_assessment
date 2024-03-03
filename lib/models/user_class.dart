import 'dart:convert';
import 'dart:ui';

import 'package:equatable/equatable.dart';

class User {
  final String userName;
  final String userInitials;
  final String userPassword;
  final String group;
  final Color color;

  User({
    required this.userName,
    required this.userInitials,
    required this.userPassword,
    required this.group,
    required this.color,
  });
}