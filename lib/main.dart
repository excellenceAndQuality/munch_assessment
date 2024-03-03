import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roy_munch_assessment/styles/colours.dart';
import 'blocs/login/login_bloc.dart';
import 'ui/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        title: 'Roy Munch Assessment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ThemeData().colorScheme.copyWith(primary: CustomColours.backgroundTextColour),
        ),
        home: const LandingPage(),
      ),
    );
  }

}


