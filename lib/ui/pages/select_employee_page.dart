import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';
import '../../models/user_class.dart';
import '../../styles/colours.dart';
import 'package:grouped_list/grouped_list.dart';

import 'login_page.dart';

class SelectEmployeePage extends StatefulWidget {
  const SelectEmployeePage({super.key});

  @override
  State<SelectEmployeePage> createState() => _SelectEmployeePageState();
}

class _SelectEmployeePageState extends State<SelectEmployeePage> {
  List<User> userList = [];
  List _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList = [
      User(userName: "Alan Parker", userInitials: "AP", userPassword: "1234", group: "", colour: "0xFF008BD0"),
      User(userName: "Amy May", userInitials: "AM", userPassword: "4567", group: "", colour: "0xFF1A887A"),
      User(userName: "Ashtron Smith", userInitials: "AS", userPassword: "8998", group: "", colour: "0xFF84AE2B"),
      User(userName: "Billy Grimmin", userInitials: "BG", userPassword: "9877", group: "B", colour: "0xFFF9871B"),
      User(userName: "Bob Barker", userInitials: "BB", userPassword: "6544", group: "B", colour: "0xFFDE0B1C"),
      User(userName: "Calvin Cole", userInitials: "CC", userPassword: "3211", group: "c", colour: "0xFF008BD0"),
      User(userName: "Chrissy Houston", userInitials: "CH", userPassword: "1111", group: "c", colour: "0xFF1A887A"),
      User(userName: "Christina Davids", userInitials: "CD", userPassword: "1221", group: "c", colour: "0xFF84AE2B"),
      User(userName: "Colt Cannon", userInitials: "CC", userPassword: "1244", group: "c", colour: "0xFFF9871B"),
    ];

    _users = [
      {
        'userName': "Alan Parker",
        'userInitials': "AP",
        'userPassword': "1234",
        'group': "",
        'colour': "0xFF008BD0",
      },
      {
        'userName': "Amy May",
        'userInitials': "AM",
        'userPassword': "4567",
        'group': "",
        'colour': "0xFF1A887A",
      },
      {
        'userName': "Ashtron Smith",
        'userInitials': "AS",
        'userPassword': "8888",
        'group': "",
        'colour': "0xFF84AE2B",
      },
      {
        'userName': "Billy Grimmin",
        'userInitials': "BG",
        'userPassword': "9877",
        'group': "B",
        'colour': "0xFFF9871B",
      },
      {
        'userName': "Bob Barker",
        'userInitials': "BB",
        'userPassword': "6544",
        'group': "B",
        'colour': "0xFFDE0B1C",
      },
      {
        'userName': "Calvin Cole",
        'userInitials': "CC",
        'userPassword': "3211",
        'group': "c",
        'colour': "0xFF008BD0",
      },
      {
        'userName': "Chrissy Houston",
        'userInitials': "CH",
        'userPassword': "1111",
        'group': "c",
        'colour': "0xFF1A887A",
      },
      {
        'userName': "Christina Davids",
        'userInitials': "CD",
        'userPassword': "1221",
        'group': "c",
        'colour': "0xFF84AE2B",
      },
      {
        'userName': "Colt Cannon",
        'userInitials': "CC",
        'userPassword': "1244",
        'group': "c",
        'colour': "0xFFF9871B",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColours.backgroundTextColour,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 50),
                child: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFDE0B1C).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/close.svg',
                          color: CustomColours.errorColour1,
                          height: 28,
                          width: 28,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const Text(
                      "Select An Employee",
                      style: TextStyle(
                          fontFamily: 'Konnect',
                          color: CustomColours.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 26),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: CustomColours.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: GroupedListView<dynamic, String>(
                  elements: _users,
                  groupBy: (index) => index['group'],
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1['userName'].compareTo(item2['userName']),
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => value.isNotEmpty
                      ? Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      value,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontFamily: 'Konnect',
                          color: CustomColours.disabledColour,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  )
                      : SizedBox(),
                  itemBuilder: (c, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginPage(
                                      index['userName'],
                                      index['userPassword'],
                                    )),
                                (route) => true);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  color: new Color(int.parse(index['colour'])),
                                  // color: Colors.primaries[
                                  //     Random().nextInt(Colors.primaries.length)],
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  index['userInitials'],
                                  style: const TextStyle(
                                      fontFamily: 'Konnect',
                                      color: CustomColours.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Text(
                              index['userName'],
                              style: const TextStyle(
                                  fontFamily: 'Konnect',
                                  color: CustomColours.backgroundTextColour,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

}
