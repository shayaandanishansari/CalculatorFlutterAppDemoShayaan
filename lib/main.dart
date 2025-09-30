import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorWidget(),
    );
  }
}

class CalculatorWidget extends StatefulWidget{
  CalculatorWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorWidgetState();
  }
}

class CalculatorWidgetState extends State<CalculatorWidget>{
  String displayText = "";

  Widget buildButton(String text, Color color){
    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(2),
            child: FittedBox(
              child: ElevatedButton(
                onPressed: () => onButtonPressed(text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Text(
                    text,
                    style: TextStyle(fontSize: 24, color: Colors.white)
                ),
              )
            )
        )
    );
  }

  void onButtonPressed(String text) {
    if (text == "C"){
      displayText = "";
    }
    else if(text == "="){
      try{
      GrammarParser p = GrammarParser();
      Expression exp = p.parse(displayText);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      displayText = eval.toString();
      }
      catch(e){
        displayText = "Error";
      }
    }
    else{
      displayText += text;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Box
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(2),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  color: Color.fromARGB( 255, 20, 207, 176),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true, //Newest text appears on the right, the only thing I didn't understand
                child: Text(
                    displayText,
                    style: TextStyle(
                      fontSize: 80,
                    ),
                  ),
              ),
            ),
          ),

          //Bottom Box
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color.fromARGB( 255, 255, 0, 77),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton("7", Colors.black),
                        buildButton("8", Colors.black),
                        buildButton("9", Colors.black),
                        buildButton("C", Colors.grey)
                      ],
                    )),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton("4", Colors.black),
                        buildButton("5", Colors.black),
                        buildButton("6", Colors.black),
                        buildButton("/", Colors.grey)
                      ],
                    )),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton("1", Colors.black),
                        buildButton("2", Colors.black),
                        buildButton("3", Colors.black),
                        buildButton("*", Colors.grey)
                      ],
                    )),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton("-", Colors.grey),
                        buildButton("0", Colors.black),
                        buildButton("+", Colors.grey),
                        buildButton("=", Colors.grey)
                      ],
                    )),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}