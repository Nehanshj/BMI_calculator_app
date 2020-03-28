import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.icon, @required this.press});

  final IconData icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: press,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
