# number_converter

A library to convert decimal numbers into or from another number system 

## Initialize a number converter

You can create a number converter with a custom alphabet:
```
NumberConverter converter = NumberConverter('0123456789ABCDEF'); //Uppercased hexadecimal
```

You can also use some predefined number systems:
```
NumberConverter converter = NumberConverter.system(NumberSystem.binary); /// Base 2
NumberConverter converter = NumberConverter.system(NumberSystem.octal); /// Base 8
NumberConverter converter = NumberConverter.system(NumberSystem.hexadesimal); /// Base 16
NumberConverter converter = NumberConverter.system(NumberSystem.base36); /// Base 36
NumberConverter converter = NumberConverter.system(NumberSystem.base56); /// Base 58
NumberConverter converter = NumberConverter.system(NumberSystem.base62); /// Base 62
NumberConverter converter = NumberConverter.system(NumberSystem.base64); /// Base 64
```

## Encode a decimal number to another number system:
```
String encoded = converter.encode(12345);
```
If the encoded string should have a minimum length:
```
String encoded = converter.encode(12345, minLength: 5);
```

## Decode a number:
```
int decoded = converter.decode('ENCODED');
```

## Run tests:
```
dart test test/number_converter_test.dart
```
