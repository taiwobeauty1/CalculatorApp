// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SimpleCalculator(),
  ));
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String question = "";
  String answer = "";
  @override
  Widget build(BuildContext context) {
    TextStyle questionAnswerStyle = TextStyle(color: Color(0xff526F9F));

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    answer,
                    style: questionAnswerStyle.copyWith(
                        fontSize: 30, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    question,
                    style: questionAnswerStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            ////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                calculatorKeys(
                    keyNumber: "CLR",
                    onpress: () {
                      setState(() {
                        answer = "";
                        question = "";
                      });
                    })
              ],
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorKeys(
                          keyNumber: "7",
                          onpress: () {
                            setState(() {
                              question += "7";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: "8",
                          onpress: () {
                            setState(() {
                              question += "8";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: "9",
                          onpress: () {
                            setState(() {
                              question += "9";
                            });
                          }),
                      calculatorSignsKeys(
                          keySigns: "+",
                          onpress: () {
                            setState(() {
                              question += "+";
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorKeys(
                          keyNumber: "4",
                          onpress: () {
                            setState(() {
                              question += "4";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: "5",
                          onpress: () {
                            setState(() {
                              question += "5";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: "6",
                          onpress: () {
                            setState(() {
                              question += "6";
                            });
                          }),
                      calculatorSignsKeys(
                          keySigns: "-",
                          onpress: () {
                            setState(() {
                              question += "-";
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorKeys(
                          keyNumber: "1",
                          onpress: () {
                            setState(() {
                              question += "1";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: "2",
                          onpress: () {
                            setState(() {
                              question += "2";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: "3",
                          onpress: () {
                            setState(() {
                              question += "3";
                            });
                          }),
                      calculatorSignsKeys(
                          keySigns: "x",
                          onpress: () {
                            setState(() {
                              question += "x";
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      calculatorKeys(
                          keyNumber: "0",
                          onpress: () {
                            setState(() {
                              question += "0";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: ".",
                          onpress: () {
                            setState(() {
                              question += ".";
                            });
                          }),
                      calculatorKeys(
                          keyNumber: "=",
                          onpress: () {
                            setState(() {
                              calculatorResults();
                            });
                          }),
                      calculatorSignsKeys(
                          keySigns: "/",
                          onpress: () {
                            setState(() {
                              question += "/";
                            });
                          }),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1A2640), Color(0xff0D1625)],
          ),
        ),
      ),
    );
  }

  calculatorKeys({keyNumber, onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 75,
        width: 75,
        child: Center(
          child: Text(
            keyNumber,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            color: keyNumber == "=" ? Color(0xff219595) : Color(0xff1D2E48),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  calculatorSignsKeys({keySigns, onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 75,
        width: 75,
        child: Center(
            child: Text(keySigns,
                style: const TextStyle(color: Colors.white, fontSize: 20))),
        decoration: BoxDecoration(
            color: const Color(0xff2968c7),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  void calculatorResults() {
    String finalUserInput = question;
    finalUserInput = question.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);

    ContextModel cm = ContextModel();

    double results = exp.evaluate(EvaluationType.REAL, cm);
    answer = results.toString();
  }
}
