import 'package:flutter/material.dart';
import 'package:roy_munch_assessment/styles/colours.dart';

class PinCircle extends StatelessWidget {
  const PinCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16.0,
      height: 16.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: CustomColours.disabledColour,
      ),
    );
  }
}
