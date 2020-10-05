import 'package:flutter/material.dart';
import 'screens/InputPage.dart';
import 'screens/results_page.dart';

//void main() => runApp(new InputPage());

void main(){
runApp(MaterialApp(

  title: 'BMI Calculator',
//  home: InputPage(),

  initialRoute: '/InputPage',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/InputPage': (context) => InputPage(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/ResultsPage': (context) => ResultsPage(),
  },

),);
}