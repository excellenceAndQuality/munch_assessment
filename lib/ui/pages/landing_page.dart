import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roy_munch_assessment/styles/colours.dart';
import 'package:roy_munch_assessment/ui/pages/select_employee_page.dart';
import 'package:roy_munch_assessment/ui/widgets/const_widgets.dart';
import 'package:roy_munch_assessment/ui/widgets/pin_circle.dart';
import '../../styles/strings.dart';
import '../main.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColours.backgroundTextColour,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Jims's place and menu icon container
              const SizedBox(
                height: 80,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: CustomColours.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'JP',
                              style: TextStyle(
                                  fontFamily: 'Konnect',
                                  color: CustomColours.backgroundTextColour,
                                  fontSize: 21),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Jim's Place",
                              style: TextStyle(
                                  fontFamily: 'Konnect',
                                  color: CustomColours.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21),
                            ),
                            Text(
                              "22 Burton Road",
                              style: TextStyle(
                                  fontFamily: 'Konnect',
                                  color: CustomColours.primaryAccent1,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/more_kebab.svg',
                          color: CustomColours.white,
                          height: 20,
                          width: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _showAppInfo(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Hi there, let's get you",
                  style: TextStyle(
                      fontFamily: 'Konnect',
                      color: CustomColours.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 26),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "logged in.",
                  style: TextStyle(
                      fontFamily: 'Konnect',
                      color: CustomColours.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 26),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              _selectEmployeeWidget(context),
              const SizedBox(
                height: 10,
              ),
              _enterPinWidget(context),
              const SizedBox(
                height: 40,
              ),
              Expanded(child: _customKeyPad())
            ],
          ),
        ));
  }

  GestureDetector _selectEmployeeWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SelectEmployeePage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColours.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      color: CustomColours.primaryAccent1,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/user_profile.svg',
                      color: CustomColours.primaryColour1,
                      height: 28,
                      width: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
                const Text("Select Employee",
                    style: TextStyle(
                        fontFamily: 'Konnect',
                        fontWeight: FontWeight.w500,
                        color: CustomColours.backgroundTextColour,
                        fontSize: 14)),
              ],
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                color: CustomColours.primaryColour1,
                height: 40,
                width: 40,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _enterPinWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => SignIn()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColours.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      color: CustomColours.primaryAccent1,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/lock_pin.svg',
                      color: CustomColours.primaryColour1,
                      height: 28,
                      width: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
                Text("Pin",
                    style: TextStyle(
                        fontFamily: 'Konnect',
                        fontWeight: FontWeight.w500,
                        color: CustomColours.backgroundTextColour,
                        fontSize: 14)),
              ],
            ),
            Row(
              children: [
                PinCircle(),
                SizedBox(width: 10,),
                PinCircle(),
                SizedBox(width: 10,),
                PinCircle(),
                SizedBox(width: 10,),
                PinCircle(),
                SizedBox(width: 20,),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _customKeyPad() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: CustomColours.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Expanded(child: Row(
            children: [
              _numberButton('1'),
              verticalDivider,
              _numberButton('2'),
              verticalDivider,
              _numberButton('3'),
            ],
          ),),
          horizontalDivider,
          Expanded(child: Row(
            children: [
              _numberButton('4'),
              verticalDivider,
              _numberButton('5'),
              verticalDivider,
              _numberButton('6'),
            ],
          ),),
          horizontalDivider,
          Expanded(child: Row(
            children: [
              _numberButton('7'),
              verticalDivider,
              _numberButton('8'),
              verticalDivider,
              _numberButton('9'),
            ],
          ),),
          horizontalDivider,
          Expanded(child: Row(
            children: [
              _numberButton('Clear'),
              verticalDivider,
              _numberButton('0'),
              verticalDivider,
              _backSpaceButton(),
            ],
          ),),

        ],
      ),
    );
  }

  //Custom keypad numbers
  Widget _numberButton(String text,) {
    return Expanded(
      child: TextButton(
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Tap Select Employee'),
            duration: Duration(seconds: 3),
          ));
        },
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Konnect',
              color: CustomColours.disabledColour,
              fontWeight: FontWeight.w400,
              fontSize: 18),
        ),
      ),
    );
  }

  //Custom keypad backspace
  Widget _backSpaceButton() {
    return Expanded(
      child: IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Tap Select Employee'),
            duration: const Duration(seconds: 3),
          ));
        },
        icon: SvgPicture.asset(
          'assets/icons/backspace_delete.svg',
          color: CustomColours.disabledColour,
          height: 20,
          width: 20,
        ),
      ),
    );
  }

  void _showAppInfo(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            //height: 180,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: CustomColours.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "App Information",
                          style: TextStyle(
                              fontFamily: 'Konnect',
                              color: CustomColours.backgroundTextColour,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFFDE0B1C).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/close.svg',
                              color: CustomColours.errorColour1,
                              height: 28,
                              width: 28,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Version: ${Strings.appVersion}",
                            style: const TextStyle(
                                fontFamily: 'Konnect',
                                color: CustomColours.backgroundTextColour,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            Strings.buildProduction,
                            style: const TextStyle(
                                fontFamily: 'Konnect',
                                color: CustomColours.backgroundTextColour,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Device ID: ACEHFJD3-DJUFG-SJHFS-84YSS",
                            style: TextStyle(
                                fontFamily: 'Konnect',
                                color: CustomColours.backgroundTextColour,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF26611).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/refresh_rotate_circle.svg',
                            color: CustomColours.errorColour1,
                            height: 28,
                            width: 28,
                          ),
                          label: const Text(
                            "Reset App",
                            style: TextStyle(
                                fontFamily: 'Konnect',
                                color: CustomColours.tertiaryColour1,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
