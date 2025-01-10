/// Utility class for number-related operations.
library;
// ignore_for_file: file_names

class NumberUtils {
  /// Converts a number to its Turkish string representation.
  ///
  /// This method handles numbers up to billions.
  ///
  /// - Parameter number: The integer to be converted.
  /// - Returns: The Turkish string representation of the number.
  ///
  /// Example:
  /// ```dart
  /// String numberStr = NumberUtils.numberToTurkishString(12345); // numberStr will be "on iki bin üç yüz kırk beş"
  /// ```
  static String numberToTurkishString(int number) {
    if (number == 0) {
      return 'sıfır';
    }

    final units = ['', 'bin', 'milyon', 'milyar'];
    final tens = [
      '',
      'on',
      'yirmi',
      'otuz',
      'kırk',
      'elli',
      'altmış',
      'yetmiş',
      'seksen',
      'doksan'
    ];
    final digits = [
      '',
      'bir',
      'iki',
      'üç',
      'dört',
      'beş',
      'altı',
      'yedi',
      'sekiz',
      'dokuz'
    ];

    String convertThreeDigitNumber(int num) {
      final hundred = num ~/ 100;
      final ten = (num % 100) ~/ 10;
      final unit = num % 10;

      String result = '';
      if (hundred > 0) {
        result += '${hundred == 1 ? 'yüz' : '${digits[hundred]} yüz'} ';
      }
      if (ten > 0) {
        result += '${tens[ten]} ';
      }
      if (unit > 0) {
        result += '${digits[unit]} ';
      }
      return result.trim();
    }

    List<String> parts = [];
    int unitIndex = 0;

    while (number > 0) {
      final part = number % 1000;
      if (part > 0) {
        final partStr = convertThreeDigitNumber(part);
        parts.add(partStr +
            (units[unitIndex].isNotEmpty ? ' ${units[unitIndex]}' : ''));
      }
      number ~/= 1000;
      unitIndex++;
    }

    String result = parts.reversed.join(' ').trim();
    if(result.contains("bin") && result.contains("bir")){
      if(result.indexOf("bin") > result.indexOf("bir")){
        result = result.replaceFirst("bir", "");
        result = result.trim();
      }
    }
    return result;
  }
}
