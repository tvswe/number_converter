import 'package:number_converter/number_converter.dart';

import 'package:test/test.dart';

void main() {
  test('Exceptions', () {
    final NumberConverter converter = NumberConverter('');

    expect(() => converter.encode(-1), throwsArgumentError);
    expect(() => converter.encode(0, minLength: 0), throwsArgumentError);
    expect(() => converter.encode(0, minLength: -1), throwsArgumentError);
  });

  group('Custom Converter', () {
    final NumberConverter converter = NumberConverter('012');

    test('Encoding', () {
      expect(converter.encode(5), '12');
      expect(converter.encode(5, minLength: 3), '012');
    });

    test('Decoding', () {
      expect(converter.decode('012'), 5);
      expect(() => converter.decode('123'), throwsArgumentError);
    });
  });

  group('Binary Converter', () {
    final NumberConverter converter = NumberConverter.system(NumberSystem.binary);

    test('Encoding', () {
      expect(converter.encode(1), '1');
      expect(converter.encode(1, minLength: 3), '001');
    });

    test('Decoding', () {
      expect(converter.decode('001'), 1);
      expect(() => converter.decode('012'), throwsArgumentError);
    });
  });

  group('Octal Converter', () {
    final NumberConverter converter = NumberConverter.system(NumberSystem.octal);

    test('Encoding', () {
      expect(converter.encode(16), '20');
      expect(converter.encode(16, minLength: 3), '020');
    });

    test('Decoding', () {
      expect(converter.decode('020'), 16);
      expect(() => converter.decode('0815'), throwsArgumentError);
    });
  });

  group('Hexadecimal Converter', () {
    final NumberConverter converter = NumberConverter.system(NumberSystem.hexadecimal);

    test('Encoding', () {
      expect(converter.encode(255), 'ff');
      expect(converter.encode(255, minLength: 3), '0ff');
    });

    test('Decoding', () {
      expect(converter.decode('0ff'), 255);
      expect(() => converter.decode('dart'), throwsArgumentError);
    });
  });


  group('Base36 Converter', () {
    final NumberConverter converter = NumberConverter.system(NumberSystem.base36);

    test('Encoding', () {
      expect(converter.encode(26314), 'kay');
      expect(converter.encode(26314, minLength: 4), '0kay');
    });

    test('Decoding', () {
      expect(converter.decode('0kay'), 26314);
      expect(() => converter.decode('Flutter'), throwsArgumentError);
    });
  });

  group('Base58 Converter', () {
    final NumberConverter converter = NumberConverter.system(NumberSystem.base58);

    test('Encoding', () {
      expect(converter.encode(202018), '2345');
      expect(converter.encode(202018, minLength: 5), '12345');
    });

    test('Decoding', () {
      expect(converter.decode('12345'), 202018);
      expect(() => converter.decode('012345'), throwsArgumentError);
    });
  });

  group('Base62 Converter', () {
    final NumberConverter converter = NumberConverter.system(NumberSystem.base62);

    test('Encoding', () {
      expect(converter.encode(79172), 'Kay');
      expect(converter.encode(79172, minLength: 4), '0Kay');
    });

    test('Decoding', () {
      expect(converter.decode('0Kay'), 79172);
      expect(() => converter.decode('50+50'), throwsArgumentError);
    });
  });

  group('Base64 Converter', () {
    final NumberConverter converter = NumberConverter.system(NumberSystem.base64);

    test('Encoding', () {
      expect(converter.encode(782530), 'C/DC');
      expect(converter.encode(782530, minLength: 5), 'AC/DC');
    });

    test('Decoding', () {
      expect(converter.decode('AC/DC'), 782530);
      expect(() => converter.decode('Base-64'), throwsArgumentError);
    });
  });
}
