import 'results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'Icon_widget.dart';
import 'consts.dart';
import 'calculate.dart';

enum gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = kpreCardcolor;
  Color femalecardcolor = kpreCardcolor;

  gender selectgen;
  int height = 180;
  int weight = 80;
  int age = 20;

  void updateColor(gender select) {
    if (select == gender.male) {
      if (malecardcolor == kpreCardcolor) {
        malecardcolor = kCardcolor;
        femalecardcolor = kpreCardcolor;
      } else {
        malecardcolor = kpreCardcolor;
      }
    }
    if (select == gender.female) {
      if (femalecardcolor == kpreCardcolor) {
        femalecardcolor = kCardcolor;
        malecardcolor = kpreCardcolor;
      } else {
        femalecardcolor = kpreCardcolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    press: () {
                      setState(() {
                        selectgen = gender.male;
                      });
                    },
                    colour:
                        selectgen == gender.male ? kCardcolor : kpreCardcolor,
                    cardChild: IconContent(
                      iconType: FontAwesomeIcons.mars,
                      textLine: 'MALE',
                    )),
              ),
              Expanded(
                child: ReusableCard(
                    press: () {
                      setState(() {
                        selectgen = gender.female;
                      });
                    },
                    colour:
                        selectgen == gender.female ? kCardcolor : kpreCardcolor,
                    cardChild: IconContent(
                      iconType: FontAwesomeIcons.venus,
                      textLine: 'FEMALE',
                    )),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kCardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: ktextStyling,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: knumStyling),
                      Text(
                        'cm',
                        style: ktextStyling,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white70,
                      overlayColor: Color(0x30EB1555),
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0, disabledThumbRadius: 5.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 243.3,
                      onChanged: (double newValue) {
                        setState(() {
                          print(newValue);
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kCardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: ktextStyling,
                      ),
                      Text(
                        weight.toString(),
                        style: knumStyling,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomButton(
                            icon: Icons.add,
                            press: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomButton(
                            icon: Icons.remove,
                            press: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kCardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: ktextStyling,
                      ),
                      Text(
                        age.toString(),
                        style: knumStyling,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomButton(
                            icon: Icons.add,
                            press: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomButton(
                            icon: Icons.remove,
                            press: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          BottomBar(
            Title: 'CALCULATE',
            Ontap: () {
              Calculate calc = Calculate(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            bmiResult: calc.calculateBMI(),
                            Interpretation: calc.getInterpretation(),
                            Remark: calc.getResult(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
