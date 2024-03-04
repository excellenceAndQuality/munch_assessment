import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'user_class.dart';

class UserProvider extends ChangeNotifier {
  List<User> userList = [
    User(
      userName: "Alan Parker",
      userInitials: "AP",
      userPassword: "1234",
      group: "",
      color: Color(0xFF008BD0),
    ),
    User(
      userName: "Amy May",
      userInitials: "AM",
      userPassword: "4567",
      group: "",
      color: Color(0xFF1A887A),
    ),
    User(
      userName: "Ashtron Smith",
      userInitials: "AS",
      userPassword: "8888",
      group: "",
      color: Color(0xFF84AE2B),
    ),
    User(
      userName: "Billy Grimmin",
      userInitials: "BG",
      userPassword: "9877",
      group: "B",
      color: Color(0xFFF9871B),
    ),
    User(
      userName: "Bob Barker",
      userInitials: "BB",
      userPassword: "6544",
      group: "B",
      color: Color(0xFFDE0B1C),
    ),
    User(
      userName: "Calvin Cole",
      userInitials: "CC",
      userPassword: "3211",
      group: "c",
      color: Color(0xFF008BD0),
    ),
    User(
      userName: "Chrissy Houston",
      userInitials: "CH",
      userPassword: "1111",
      group: "c",
      color: Color(0xFF1A887A),
    ),
    User(
      userName: "Christina Davids",
      userInitials: "CD",
      userPassword: "1221",
      group: "c",
      color: Color(0xFF84AE2B),
    ),
    User(
      userName: "Colt Cannon",
      userInitials: "CC",
      userPassword: "1244",
      group: "c",
      color: Color(0xFFF9871B),
    ),
  ];
}