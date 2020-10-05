import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_contant.dart';
import '../components/reusable_card.dart';

import '../constants.dart';
import 'results_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:flutterappbmicalculator/calculator_brain.dart';

enum Gender{male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCodeColor = kInactiveCodeColor;
  Color femaleCodeColor = kInactiveCodeColor;

  Gender selecteGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark()
          .copyWith(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF1D1E33),
          accentColor: Color(0xFFEB1555),
          bottomAppBarColor: Colors.blue,
        ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(child: Row(
              children: <Widget>[

             Expanded(child: ReuseableCard(
                  onPress: (){
                    setState(() {
                      selecteGender = Gender.male;
                    });
                  },
                  colour: selecteGender == Gender.male ? maleCodeColor = kActiveCodeColor :
                      femaleCodeColor = kInactiveCodeColor,
                  cardChield: new IconContent(icon: FontAwesomeIcons.male,label: 'MALE'),
             ),),
              Expanded(child: ReuseableCard(
                onPress: (){
                  setState(() {
                    selecteGender = Gender.female;
                  });
                },
                colour: selecteGender == Gender.female ? femaleCodeColor = kActiveCodeColor :
                        maleCodeColor = kInactiveCodeColor,
                cardChield:new IconContent(icon: FontAwesomeIcons.female, label: 'FEMALE',) ,),),

            ],),),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReuseableCard(
                    colour: kCardContainerColor,
                    cardChield: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT',style: kLabelTextStyle,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: kNumberTextStyle,),
                            Text('cm',style: kLabelTextStyle,),

                          ],
                        ),
                      ],
                    ))
                )
              ],
            ),),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                thumbColor: Color(0xFFEB1555),
                activeTrackColor: Color(0xFFEB1555),
                inactiveTrackColor: Color(0xFF8D8E98),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120,
                max: 220,
                onChanged: (double newValue){
                  setState(() {
                    height = newValue.round();
                  });
                },
              ),
            ),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(child: ReuseableCard(
                    colour: kCardContainerColor,
                  cardChield: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',style: kLabelTextStyle,),
                      Text(weight.toString(),style: kNumberTextStyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        SizedBox(width: 10,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },)
                        ],
                      ),

                    ],
                  ),
                ),),
                Expanded(child: ReuseableCard(
                    colour: kCardContainerColor,
                    cardChield: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: kLabelTextStyle,),
                        Text(age.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                              setState(() {
                                age--;
                              });
                              },),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),

                          ],
                        ),
                      ],
                    ),),),
              ],
            ),),

            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: (){
                CalculatorBrain calc = new CalculatorBrain(weight: weight, height: height);

                Navigator.pushNamed(context, '/ResultsPage',
                  arguments: calc);
            },
            ),

          ],
        ),
      ),);
  }
}




