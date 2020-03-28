import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({this.Remark, this.Interpretation, this.bmiResult});

  final String Remark;
  final String Interpretation;
  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.0),
                  padding: EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Your Results:',
                    style: kresultTitle,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ReusableCard(
                    colour: kCardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Remark.toUpperCase(),
                          style: kremark,
                        ),
                        Text(
                          bmiResult,
                          style: kBMI,
                        ),
                        Text(
                          Interpretation,
                          textAlign: TextAlign.center,
                          style: kBody,
                        ),
                      ],
                    )),
              ),
              BottomBar(
                Title: 'RE-CALCULATE',
                Ontap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
    //Container(
    //  child: Text('Results'),
    //);
  }
}
