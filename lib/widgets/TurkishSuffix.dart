// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use
import 'package:flutter/widgets.dart';
import 'package:turkish_suffix/src/enums/Ekler.dart';
import 'package:turkish_suffix/src/extensions/Suffix.dart';

/// A widget that applies Turkish suffixes to a given text.
class TurkishSuffix extends StatelessWidget {
  /// The text to which the suffix will be applied.
  final Text? text;

  /// The suffix to be applied.
  final Ek ek;

  /// Indicates whether the text is a proper noun.
  final bool proper_noun;

  /// The person for possessive suffixes.
  final Person person;

  /// The quantity for possessive suffixes.
  final Quantity quantity;

  final bool writeOut;

  /// Creates a [TurkishSuffix] widget.
  const TurkishSuffix(
      {super.key,
      required this.text,
      required this.ek,
      this.person = Person.ben,
      this.quantity = Quantity.plural,
      this.proper_noun = false,
      this.writeOut = false})
      : assert(text != null, 'Text widget must not be null');

  @override
  Widget build(BuildContext context) {
    String result = text!.data ?? "";

    if (result == "") {
      return Text(result);
    }

    switch (ek) {
      case Ek.MASTAR:
      case Ek.MAK:
        result = result.makeInfinitive();
        break;
      case Ek.COGUL:
      case Ek.LAR:
        result = result.makePlural(proper_noun: proper_noun);
        break;
      case Ek.BELIRTME:
      case Ek.I:
        result = result.makeAccusative(proper_noun: proper_noun);
        break;
      case Ek.YONELME:
      case Ek.A:
        result = result.makeDative(proper_noun: proper_noun);
        break;
      case Ek.TAMLAYAN:
      case Ek.NIN:
        result = result.makeGenitive(proper_noun: proper_noun);
        break;
      case Ek.AYRILMA:
      case Ek.DAN:
        result = result.makeAblative(proper_noun: proper_noun);
        break;
      case Ek.BULUNMA:
      case Ek.DA:
        result = result.makeLocative(proper_noun: proper_noun);
        break;
      case Ek.IYELIK:
      case Ek.IM:
        result = result.possessiveAffix(
            person: person, quantity: quantity, properNoun: proper_noun);
        break;
      case Ek.SIRALAMA:
        result = result.applyNumberOrderSuffix(writeOut: writeOut);
        break;
    }

    return Text(
      result,
      style: text!.style,
      strutStyle: text!.strutStyle,
      textAlign: text!.textAlign,
      textDirection: text!.textDirection,
      locale: text!.locale,
      softWrap: text!.softWrap,
      overflow: text!.overflow,
      textScaleFactor: text!.textScaleFactor,
      maxLines: text!.maxLines,
      semanticsLabel: text!.semanticsLabel,
      textWidthBasis: text!.textWidthBasis,
      textHeightBehavior: text!.textHeightBehavior,
    );
  }

  /// Factory constructor that creates a `TurkishSuffix` instance for number order suffixes.
  ///
  /// The provided [text] must contain a valid number, otherwise an assertion error is thrown.
  ///
  /// Example:
  /// ```dart
  /// TurkishSuffix.numberOrder(Text('1')); // Creates a TurkishSuffix for the number 1
  /// ```
  ///
  /// Throws:
  /// - `AssertionError` if the [text] does not contain a valid number.
  ///
  /// Parameters:
  /// - [text]: A `Text` widget containing the number for which the suffix is to be generated.
  factory TurkishSuffix.numberOrder(Text text, {bool writeOut = false}) {
    assert(int.tryParse(text.data ?? '') != null, 'Text must be a number');
    return TurkishSuffix(
      text: text,
      ek: Ek.SIRALAMA,
      writeOut: writeOut,
    );
  }
}
