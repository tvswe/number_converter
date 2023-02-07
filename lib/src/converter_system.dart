enum NumberSystem {
  /// Base 2
  binary('01'),

  /// Base 8
  octal('01234567'),

  /// Base 16
  hexadecimal('0123456789abcdef'),

  /// Base 36
  base36('0123456789abcdefghijklmnopqrstuvwxyz'),

  /// Base 58
  base58('123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz'),

  /// Base 62
  base62('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'),

  /// Base 64
  base64('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/');

  final String alphabet;

  const NumberSystem(this.alphabet);
}
