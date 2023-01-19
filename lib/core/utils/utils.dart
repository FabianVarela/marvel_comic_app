import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class Utils {
  static String generateHash(String inputText, int timestamp) {
    final bytes = utf8.encode('$timestamp$inputText');
    return hex.encode(md5.convert(bytes).bytes);
  }
}
