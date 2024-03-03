import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../models/user_class.dart';
import '../../styles/colours.dart';
import 'package:grouped_list/grouped_list.dart';

import 'login_page.dart';

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

class SelectEmployeePage extends StatelessWidget {
  const SelectEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Scaffold(
        backgroundColor: CustomColours.backgroundTextColour,
        body: SafeArea(
          child: Consumer<UserProvider>(
            builder: (context, provider, _) => Container(
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
                            color:
                            const Color(0xFFDE0B1C).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
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
                            fontSize: 26,
                          ),
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
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: GroupedListView<User, String>(
                        elements: provider.userList,
                        groupBy: (user) => user.group,
                        groupComparator: (value1, value2) =>
                            value2.compareTo(value1),
                        itemComparator: (item1, item2) =>
                            item1.userName.compareTo(item2.userName),
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        groupSeparatorBuilder: (String value) =>
                        value.isNotEmpty
                            ? Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            value,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'Konnect',
                              color: CustomColours.disabledColour,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        )
                            : SizedBox(),
                        itemBuilder: (context, user) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(
                                    user.userName,
                                    user.userPassword,
                                  ),
                                ),
                                    (route) => true,
                              );
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
                                      color: user.color,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        user.userInitials,
                                        style: const TextStyle(
                                          fontFamily: 'Konnect',
                                          color: CustomColours.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    user.userName,
                                    style: const TextStyle(
                                      fontFamily: 'Konnect',
                                      color: CustomColours.backgroundTextColour,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
