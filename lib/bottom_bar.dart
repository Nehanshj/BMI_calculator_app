import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  BottomBar({this.Title, this.Ontap});

  final String Title;
  final Function Ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Container(
        child: Center(
          child: Text(Title, style: kcalcbuttonstyling),
        ),
        color: kBottomContainercolor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
