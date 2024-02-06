import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function callBack;
  const CalculatorButton(
      {required this.text, required this.textSize, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: 70.0,
        height: 70.0,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.blueGrey.shade900),
          ),
          onPressed: () {
            callBack(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize)),
          ),
        ),
      ),
    );
  }
}
