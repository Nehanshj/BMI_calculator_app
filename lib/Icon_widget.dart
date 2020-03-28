import 'package:flutter/material.dart';
import 'consts.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.iconType, @required this.textLine});
  final IconData iconType;
  final String textLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textLine,
          style: ktextStyling,
        )
      ],
    );
  }
}
