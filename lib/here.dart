import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorWidget(),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorWidgetState();
  }
}

class CalculatorWidgetState extends State<CalculatorWidget> {
  String displayText = "";

  void onButtonPressed(String text) {
    if (text == "C"){
      displayText = "";
    }
    else{
      displayText += text;
    }
    setState(() {});
  }

  Widget buildExpandedButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Display bar
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 20, 207, 176),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Text(
                displayText,
                style: const TextStyle(fontSize: 32, color: Colors.black),
              ),
            ),
          ),

          // Button grid
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 0, 77),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        buildExpandedButton('7', Colors.black),
                        buildExpandedButton('8', Colors.black),
                        buildExpandedButton('9', Colors.black),
                        buildExpandedButton('C', Colors.red),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        buildExpandedButton('4', Colors.black),
                        buildExpandedButton('5', Colors.black),
                        buildExpandedButton('6', Colors.black),
                        buildExpandedButton('/', Colors.grey),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        buildExpandedButton('1', Colors.black),
                        buildExpandedButton('2', Colors.black),
                        buildExpandedButton('3', Colors.black),
                        buildExpandedButton('*', Colors.grey),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        buildExpandedButton('-', Colors.grey),
                        buildExpandedButton('0', Colors.black),
                        buildExpandedButton('+', Colors.grey),
                        buildExpandedButton('=', Colors.green),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
