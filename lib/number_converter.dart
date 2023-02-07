library number_converter;

export 'src/converter_system.dart';

import 'dart:math';
import 'package:number_converter/src/converter_system.dart';

class NumberConverter {
  final String alphabet;

  NumberConverter(this.alphabet);

  static NumberConverter system(NumberSystem converterBase) =>
      NumberConverter(converterBase.alphabet);

  String encode(int number, {minLength = 1}) {
    if (number < 0) {
      throw ArgumentError.value(number, 'Has to be greater than 0!');
    }

    if (minLength < 1) {
      throw ArgumentError.value(minLength, 'Has to be greater than 1!');
    }

    String encoded = '';

    while (number >= alphabet.length) {
      encoded = alphabet[number % alphabet.length] + encoded;
      number ~/= alphabet.length;
    }

    if (number > 0) {
      encoded = alphabet[number] + encoded;
    }

    return encoded.padLeft(minLength, alphabet[0]);
  }

  int decode(String number) {
    if (!_isValid(number)) {
      throw ArgumentError.value(
          number, 'Number has invalid chars! Allowed chars: "$alphabet"');
    }

    int decoded = 0;

    for (int i = 0; i < number.length; i++) {
      int value = alphabet.indexOf(number[number.length - i - 1]);
      int factor = pow(alphabet.length, i) as int;
      decoded += value * factor;
    }

    return decoded;
  }

  bool _isValid(String number) {
    for (int i = 0; i < number.length; i++) {
      if (alphabet.contains(number[i]) == false) {
        return false;
      }
    }

    return true;
  }
}
