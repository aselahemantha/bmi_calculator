import 'package:flutter/material.dart';
import '../constants.dart';

class iconContent extends StatelessWidget {

  final String txt;
  final IconData icn;

  iconContent(this.txt, this.icn);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icn,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          txt,
          style: kLabelText,
        ),
      ],
    );
  }
}