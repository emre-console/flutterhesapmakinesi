import 'number-formatter.dart';

class Calculations {
  static const NOKTA = '.';
  static const CARP = '*';
  static const CIKAR = '-';
  static const TOPLA = '+';
  static const BOL = '/';
  static const Temizle = 'TEMİZLE';
  static const ESIT = '=';
  static const Operatorler = [
    Calculations.TOPLA,
    Calculations.CARP,
    Calculations.CIKAR,
    Calculations.BOL,
  ];

  static double add(double a, double b) => a + b;
  static double subtract(double a, double b) => a - b;
  static double divide(double a, double b) => a / b;
  static double multiply(double a, double b) => a  * b;
}

class Calculator {
  static String parseString(String text) {
    List<String> numbersToAdd;
    double a, b, result;
    if (text.contains(Calculations.TOPLA)) {
      numbersToAdd = text.split(Calculations.TOPLA);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.add(a, b);
    } else if (text.contains(Calculations.CARP)) {
      numbersToAdd = text.split(Calculations.CARP);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.multiply(a, b);
    } else if (text.contains(Calculations.BOL)) {
      numbersToAdd = text.split(Calculations.BOL);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.divide(a, b);
    } else if (text.contains(Calculations.CIKAR)) {
      numbersToAdd = text.split(Calculations.CIKAR);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.subtract(a, b);
    } else {
      return text;
    }

    return NumberFormatter.format(result.toString());
  }
  static String addPeriod(String calculatorString) {
    if (calculatorString.isEmpty) {
      return calculatorString = '0${Calculations.NOKTA}';
    }

    RegExp exp = new RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString) ? 2 : 1;

    return matches.length == maxMatches
        ? calculatorString
        : calculatorString += Calculations.NOKTA;
  }

  static bool includesOperation(String calculatorString) {
    for (var operation in Calculations.Operatorler) {
      if (calculatorString.contains(operation)) {
        return true;
      }
    }

    return false;
  }
}
