import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappbmicalculator/calculator_brain.dart';
import 'package:flutterappbmicalculator/components/bottom_button.dart';
import 'package:flutterappbmicalculator/screens/InputPage.dart';
import 'package:flutterappbmicalculator/constants.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {

  CalculatorBrain calc;

  String bmiResult;
  String resultText;
  String interpretation;

  @override
  Widget build(BuildContext context) {

    RouteSettings settings = ModalRoute.of(context).settings;
    calc = settings.arguments;

    bmiResult = calc.calculatorBMI();
    resultText = calc.getResult();
    interpretation = calc.getInterpretation();

    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF1D1E33),
        accentColor: Color(0xFFEB1555),
        bottomAppBarColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('BIM CALCULATOR'),
        centerTitle: true,),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kTitleTextStyle,),
            ),),

            Expanded(
              flex: 5,
              child: ReuseableCard(
                colour: kActiveCodeColor,
                cardChield: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text(resultText.toUpperCase(), style: kResultTextStyle,),

                    Text(bmiResult, style: kBMITextStyle,),

                    Text(interpretation,
                      textAlign:TextAlign.center,style: kBodyTextStyle,),
                  ],
                ),
              ),
            ),

            BottomButton(buttonTitle: 'RE-CALCULATE',onTap: (){
              Navigator.pushNamed(context, '/InputPage');
            },)
          ],
        ),
      ),
    );
  }
}
