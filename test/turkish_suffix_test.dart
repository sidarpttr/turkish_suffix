import 'package:flutter_test/flutter_test.dart';
import 'package:turkish_suffix/src/enums/Ekler.dart';
import 'package:turkish_suffix/src/extensions/Suffix.dart';

void main() {
  /// Test for default suffix methods.
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

  /// Test for possessive suffix methods.
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

  /// Test for proper noun suffix methods.
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

  /// Test for consonant softening rules.
  test("yumuşama test", () {
    expect("dolap".makeDative(), "dolaba");
    expect("ağaç".makeDative(), "ağaca");
    expect("çocuk".makeDative(), "çocuğa");
  });

  /// Test for exception words.
  test("exceptions", () {
    expect("ahval".makeDative(), "ahvale");
    expect("ampul".makeAccusative(), "ampulü");
    expect("cemaat".makeGenitive(), "cemaatin");
    expect("kalp".makeDative(), "kalbe");
    expect(
        "kemal"
            .possessiveAffix(person: Person.ben, quantity: Quantity.singular),
        "kemalim");
    expect("ohal".makeDative(), "ohale");
    expect("saat".makeDative(), "saate");
    expect("ziraat".makeDative(), "ziraate");
  });

  /// Test for number order suffixes.
  test("number orders", () {
    expect("1".applyNumberOrderSuffix(), "1'inci");
    expect("2".applyNumberOrderSuffix(), "2'nci");
    expect("3".applyNumberOrderSuffix(), "3'üncü");
    expect("4".applyNumberOrderSuffix(), "4'üncü");
    expect("5".applyNumberOrderSuffix(), "5'inci");
    expect("6".applyNumberOrderSuffix(), "6'ncı");
    expect("7".applyNumberOrderSuffix(), "7'nci");
    expect("8".applyNumberOrderSuffix(), "8'inci");
    expect("9".applyNumberOrderSuffix(), "9'uncu");
    expect("10".applyNumberOrderSuffix(), "10'uncu");
    expect("20".applyNumberOrderSuffix(), "20'nci");
    expect("30".applyNumberOrderSuffix(), "30'uncu");
    expect("40".applyNumberOrderSuffix(), "40'ıncı");
    expect("50".applyNumberOrderSuffix(), "50'nci");
    expect("60".applyNumberOrderSuffix(), "60'ıncı");
    expect("70".applyNumberOrderSuffix(), "70'inci");
    expect("80".applyNumberOrderSuffix(), "80'inci");
    expect("90".applyNumberOrderSuffix(), "90'ıncı");
    expect("100".applyNumberOrderSuffix(), "100'üncü");
    expect("1000".applyNumberOrderSuffix(), "1000'inci");
    expect("1000000".applyNumberOrderSuffix(), "1000000'uncu");
    expect("1000000000".applyNumberOrderSuffix(), "1000000000'ıncı");
  });
}
