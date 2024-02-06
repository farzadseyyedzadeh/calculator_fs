import 'package:calculator_fs/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNum;
  late int secondNum;
  String history = '';
  String textToDisplay = '';
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == "=") {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('FS Calculator'),
        ),
        body: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: 'C',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '<',
                    textSize: 30,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '/',
                    textSize: 30,
                    callBack: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '7',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '8',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '9',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: 'X',
                    textSize: 30,
                    callBack: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '4',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '5',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '6',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '-',
                    textSize: 36,
                    callBack: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '1',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '2',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '3',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '+',
                    textSize: 36,
                    callBack: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '0',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '.',
                    textSize: 24,
                    callBack: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '=',
                    textSize: 36,
                    callBack: btnOnClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
