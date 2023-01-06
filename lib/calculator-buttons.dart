import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator-button.dart';
import 'calculator-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({@required this.onTap});

  final CalculatorButtonTapCallback onTap;
  final calculatorButtonRows = [
    ['7', '8', '9', Calculations.BOL],
    ['4', '5', '6', Calculations.CARP],
    ['1', '2', '3', Calculations.CIKAR],
    [Calculations.NOKTA, '0', '00', Calculations.TOPLA],
    [Calculations.Temizle, Calculations.ESIT]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: calculatorButtonRows.map((calculatorRowButtons) {
        return CalculatorRow(
          buttons: calculatorRowButtons,
          onTap: onTap,
        );
      }).toList()
    );
  }
}
