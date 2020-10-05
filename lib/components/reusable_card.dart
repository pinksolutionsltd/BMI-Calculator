import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget{
  const ReuseableCard({@required this.colour, this.cardChield, this.onPress});

  final Color colour;
  final Widget cardChield;
  final Function onPress;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChield,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}