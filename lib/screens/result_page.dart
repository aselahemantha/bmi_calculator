import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reuseble_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {

  late final String bmi;
  late final String result;
  late final String text;

  ResultPage({required this.bmi, required this.result , required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title:  Center(child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontFamily: 'source',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
                child: Container(
                  child: Center(
                    child: Text(
                      'Your Result',
                      style: kTitleText,
                    ),
                  ),
                ),
            ),
            Expanded(
              flex: 5,
                child: reusableCard(
                  colour: kActiveBlockColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        result.toUpperCase(),
                        style: kWeightStateText,
                      ),
                      Text(
                        bmi,
                        style: kBMIText,
                      ),
                      Text(
                        text,
                        style: kLabelText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPress: (){
                  },
                ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                onTap: (){
                  Navigator.pop(context);
                  },
                lableText: 'RE-CALCULATE',
              )
            ),
          ],
        ),
      );
  }
}