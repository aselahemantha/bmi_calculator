import 'package:flutter/material.dart';
import '../constants.dart';


class RoundedIconButton extends StatelessWidget {

  final IconData icn;

  RoundedIconButton({required this.icn});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icn),
        onPressed: (){

        },
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
