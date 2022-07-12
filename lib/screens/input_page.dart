import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reuseble_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/rounded_icon.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.none;

  Color maleCardColour = kInactiveBlockColor;
  Color femaleCardColour = kInactiveBlockColor;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontFamily: 'source',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusableCard(
                    onPress:(){
                      setState((){
                        selectedGender = Gender.male;
                      },);
                    },
                    colour: selectedGender == Gender.male ? kActiveBlockColor : kInactiveBlockColor,
                    cardChild: iconContent('MALE',FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    onPress:(){
                      setState((){
                        selectedGender = Gender.female;
                      },);
                    },
                    colour: selectedGender == Gender.female ? kActiveBlockColor : kInactiveBlockColor,
                    cardChild: iconContent('FEMALE',FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
              colour: kActiveBlockColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kLableNumber,
                      ),
                      Text(
                        ' cm',
                        style: kLabelText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState((){
                          height = newValue.round();
                        },);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusableCard(
                    colour: kActiveBlockColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelText,
                        ),
                        Text(
                          weight.toString(),
                          style: kLableNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icn: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState((){
                                  weight--;
                                },);
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedIconButton(
                              icn: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  weight++;
                                },);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusableCard(
                    colour: kActiveBlockColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelText,
                        ),
                        Text(
                          age.toString(),
                          style: kLableNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icn: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState((){
                                  age--;
                                },);
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedIconButton(
                              icn: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  age++;
                                },);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              onTap: (){
                Calculator_Brain cal = Calculator_Brain(weight: weight, height: height);



                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return ResultPage(
                        bmi: cal.calculateBMI(),
                        result: cal.getResult(),
                        text: cal.getText(),
                      );
                    },
                  ),
                );
              },
          lableText: 'CALCULATE',
          )
        ],
      ),
    );
  }
}


class RoundedIconButton extends StatelessWidget {

  final IconData icn;
  final void Function() onPressed;

  RoundedIconButton({required this.icn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icn),
      onPressed: onPressed,
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