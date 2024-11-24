import 'package:flutter_test/flutter_test.dart';
import 'package:turkish_suffix/src/enums/Ekler.dart';
import 'package:turkish_suffix/src/extensions/Suffix.dart';

void main() {
  test('default test', () {
    expect("git".makeInfinitive(), "gitmek");
    expect("sidar".makePlural(proper_noun: true), "sidar'lar");
    expect("sidar".makeAccusative(proper_noun: true), "sidar'ı");
    expect("sidar".makeDative(proper_noun: true), "sidar'a");
    expect("sidar".makeGenitive(proper_noun: true), "sidar'ın");
    expect("sidar".makeAblative(proper_noun: true), "sidar'dan");
    expect("sidar".makeLocative(proper_noun: true), "sidar'da");
    expect(
        "sidar".possessiveAffix(
            person: Person.bir, quantity: Quantity.plural, properNoun: true),
        "sidar'ımız");
  });

  test('possesiveAffix test', () {
    expect(
        "sidar".possessiveAffix(
            person: Person.bir, quantity: Quantity.singular, properNoun: true),
        "sidar'ım");
    expect(
        "sidar".possessiveAffix(
            person: Person.iki, quantity: Quantity.singular, properNoun: true),
        "sidar'ın");
    expect(
        "sidar".possessiveAffix(
            person: Person.uc, quantity: Quantity.singular, properNoun: true),
        "sidar'ı");
    expect(
        "sidar".possessiveAffix(
            person: Person.bir, quantity: Quantity.plural, properNoun: true),
        "sidar'ımız");
    expect(
        "sidar".possessiveAffix(
            person: Person.iki, quantity: Quantity.plural, properNoun: true),
        "sidar'ınız");
    expect(
        "sidar".possessiveAffix(
            person: Person.uc, quantity: Quantity.plural, properNoun: true),
        "sidar'ları");
  });

  test('proper noun test', () {
    expect("sidar".makePlural(proper_noun: true), "sidar'lar");
    expect("sidar".makePlural(), "sidarlar");

    expect("sidar".makeAccusative(proper_noun: true), "sidar'ı");
    expect("sidar".makeAccusative(), "sidarı");

    expect("sidar".makeDative(proper_noun: true), "sidar'a");
    expect("sidar".makeDative(), "sidara");

    expect("sidar".makeGenitive(proper_noun: true), "sidar'ın");
    expect("sidar".makeGenitive(), "sidarın");

    expect("sidar".makeAblative(proper_noun: true), "sidar'dan");
    expect("sidar".makeAblative(), "sidardan");

    expect("sidar".makeLocative(proper_noun: true), "sidar'da");
    expect("sidar".makeLocative(), "sidarda");

    expect(
        "sidar".possessiveAffix(
            person: Person.uc, quantity: Quantity.plural, properNoun: true),
        "sidar'ları");
    expect(
        "sidar".possessiveAffix(
          person: Person.uc,
          quantity: Quantity.plural,
        ),
        "sidarları");
  });

  test("yumuşama test", () {
    expect("dolap".makeDative(), "dolaba");
    expect("ağaç".makeDative(), "ağaca");
    expect("kurt".makeDative(), "kurda");
    expect("çocuk".makeDative(), "çocuğa");
  });
}
