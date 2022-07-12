import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.lableText,required this.onTap});

  final void Function() onTap;
  late final String lableText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            lableText,
            style: kBottomText,
          ),
        ),
        color: kBottomColor,
        height: kBottomHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.0),
      ),
    );
  }
}