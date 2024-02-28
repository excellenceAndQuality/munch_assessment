import 'package:flutter/material.dart';
import 'package:roy_munch_assessment/styles/colours.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roy Munch Assessment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ThemeData().colorScheme.copyWith(primary: CustomColours.backgroundTextColour),
      ),
      home: LandingPage(),
    );
  }
}

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'CustomIcons';
  static const String? _kFontPkg = null;

  static const IconData pill = IconData(
      0xea60, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

