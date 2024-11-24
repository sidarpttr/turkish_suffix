import 'package:flutter/widgets.dart';
import 'package:turkish_suffix/src/enums/Ekler.dart';
import 'package:turkish_suffix/src/extensions/Suffix.dart';
import 'package:turkish_suffix/src/models/Hatalar.dart';

class TurkishSuffix extends StatelessWidget {
  final Text? text;
  final Ek ek;
  final bool proper_noun;
  final Person person;
  final Quantity quantity;

  const TurkishSuffix(
      {super.key,
      required this.text,
      required this.ek,
      this.person = Person.ben,
      this.quantity = Quantity.plural,
      this.proper_noun = false})
      : assert(text != null, 'Text widget must not be null');

  @override
  Widget build(BuildContext context) {
    String result = text!.data ?? "";

    if (result == "") {
      return Text(result);
    }

    switch (ek) {
      case Ek.MASTAR || Ek.MAK:
        result = result.makeInfinitive();

        break;
      case Ek.COGUL || Ek.LAR:
        result = result.makePlural(proper_noun: proper_noun);

        break;
      case Ek.BELIRTME || Ek.I:
        result = result.makeAccusative(proper_noun: proper_noun);

        break;
      case Ek.YONELME || Ek.A:
        result = result.makeDative(proper_noun: proper_noun);

        break;
      case Ek.TAMLAYAN || Ek.NIN:
        result = result.makeGenitive(proper_noun: proper_noun);

        break;
      case Ek.AYRILMA || Ek.DAN:
        result = result.makeAblative(proper_noun: proper_noun);

        break;
      case Ek.BULUNMA || Ek.DA:
        result = result.makeLocative(proper_noun: proper_noun);

        break;
      case Ek.IYELIK || Ek.IM:
        result = result.possessiveAffix(
            person: person, quantity: quantity, properNoun: proper_noun);

        break;

      default:
        throw EkHatasi("Böyle bir ek yok");
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
}
