// ignore_for_file: unused_element, file_names, non_constant_identifier_names
import 'package:turkish_suffix/src/constants/Ekler.dart';
import 'package:turkish_suffix/src/enums/Ekler.dart' show Person, Quantity;
import 'package:turkish_suffix/src/utils/NumberUtils.dart';

/// Extension methods for adding Turkish suffixes to strings.
extension TurkishSuffixExtension on String {
  /// Returns the last word in the string.
  String __getLastWord() => toLowerCase().split(" ").last;

  /// Trims all spaces from the string.
  String __trim() => replaceAll(" ", "");

  /// Returns a list of vowels in the string.
  List<dynamic> __getVowels() {
    var list = [];
    for (var vowel in Constants.VOWELS.split("")) {
      if (contains(vowel)) {
        list.add(vowel);
      }
    }
    return list;
  }

  /// Converts the string to lowercase, handling Turkish-specific characters.
  String __toLower() => replaceAll("I", "ı").replaceAll("İ", "i").toLowerCase();

  /// Returns a map containing the last vowel in the string and its properties.
  Map<dynamic, dynamic> __getLastVowel() {
    Map<dynamic, dynamic> returnData = {"letter": "", "tone": "", "count": 0};

    var word = __toLower();

    for (var let in word.split("")) {
      if (Constants.FRONT_VOWELS.contains(let)) {
        returnData["count"]++;
        returnData["letter"] = let;
        returnData["tone"] = "front";
      } else if (Constants.BACK_VOWELS.contains(let)) {
        returnData["count"]++;
        returnData["letter"] = let;
        returnData["tone"] = "back";
      }
    }

    if (Constants.EXCEPTIONS.contains(word)) {
      if (returnData["letter"] == "o") {
        returnData = {
          "letter": "ö",
          "tone": "back",
          "count": returnData["count"]
        };
      } else if (returnData["letter"] == "a") {
        returnData = {
          "letter": "e",
          "tone": "back",
          "count": returnData["count"]
        };
      } else if (returnData["letter"] == "u") {
        returnData = {
          "letter": "ü",
          "tone": "back",
          "count": returnData["count"]
        };
      }
    }

    return returnData;
  }

  /// Returns a map containing the last letter in the string and its properties.
  Map<String, dynamic> __getLastLetter() {
    String word = __toLower();
    Map<String, dynamic> returnData = {
      "vowel": false,
      "consonant": false,
      "hard_consonant": false,
      "discontinious_hard_consonant_for_suffix": false,
      "soften_consonant_for_suffix": "",
    };

    if (word.isEmpty) {
      return returnData;
    }

    String lastLetter = word.substring(word.length - 1);

    if (word.endsWith("'") && word.length > 1) {
      lastLetter = word.substring(word.length - 2, word.length - 1);
    }

    returnData["letter"] = lastLetter;

    if (Constants.VOWELS.contains(lastLetter)) {
      returnData["vowel"] = true;
      if (Constants.FRONT_VOWELS.contains(lastLetter)) {
        returnData["front_vowel"] = true;
      } else {
        returnData["back_vowel"] = true;
      }
    } else {
      returnData["consonant"] = true;
      if (Constants.HARD_CONSONANTS.contains(lastLetter)) {
        returnData["hard_consonant"] = true;
        if (Constants.DISCONTINIOUS_HARD_CONSONANTS.contains(lastLetter)) {
          returnData["discontinious_hard_consonant_for_suffix"] = true;
          returnData["soften_consonant_for_suffix"] = Constants.SOFTEN_DHC[
              Constants.DISCONTINIOUS_HARD_CONSONANTS.indexOf(lastLetter)];
        }
      }
    }

    return returnData;
  }

  /// Adds the infinitive suffix to the string.
  String makeInfinitive() =>
      __getLastVowel()["tone"] == "front" ? "${this}mak" : "${this}mek";

  /// Adds the plural suffix to the string.
  ///
  /// If [proper_noun] is true, an apostrophe is added before the suffix.
  String makePlural({bool proper_noun = false}) {
    String word = this;
    if (proper_noun) {
      word += "'";
    }
    return word.__getLastVowel()["tone"] == "front"
        ? "${word}lar"
        : "${word}ler";
  }

  /// Adds the accusative suffix to the string.
  ///
  /// If [proper_noun] is true, an apostrophe is added before the suffix.
  String makeAccusative({bool proper_noun = false}) {
    String lowerword = __toLower();
    String word = this;
    if (lowerword == "o") {
      return proper_noun ? "O'nu" : "onu";
    } else {
      final lastLetter = __getLastLetter();
      final lastVowel = __getLastVowel();

      if (proper_noun) word += "'";

      if (lastLetter["vowel"]) {
        word += "y";
      } else if (lastLetter["discontinious_hard_consonant_for_suffix"] &&
          !proper_noun) {
        if (lastVowel["count"] >= 1 &&
            (!Constants.EXCEPTIONS.contains(this) || lastVowel["count"] == 1)) {
          word = word.substring(0, word.length - 1) +
              (lastLetter["soften_consonant_for_suffix"]);
        }
      }

      word = "$word${Constants.MINOR_HARMONY[lastVowel["letter"]]}";
    }

    return word;
  }

  /// Adds the dative suffix to the string.
  ///
  /// If [proper_noun] is true, an apostrophe is added before the suffix.
  String makeDative({bool proper_noun = false}) {
    String word = this;
    String lowerWord = __toLower();

    if (lowerWord == "ben" && !proper_noun) {
      word = "bana";
    } else if (lowerWord == "sen" && !proper_noun) {
      word = "sana";
    } else {
      final lastLetter = __getLastLetter();
      final lastVowel = __getLastVowel();

      if (proper_noun) word += "'";
      if (lastLetter["vowel"]) {
        word += "y";
      } else if (lastVowel["count"] >= 1 &&
          lastLetter["discontinious_hard_consonant_for_suffix"] &&
          (!Constants.EXCEPTIONS.contains(this) || lastVowel["count"] == 1)) {
        if (!proper_noun) {
          word = word.substring(0, word.length - 1) +
              (lastLetter["soften_consonant_for_suffix"]);
        }
      }

      if (lastVowel["tone"] == "front") {
        word += "a";
      } else {
        word += "e";
      }
    }
    return word;
  }

  /// Adds the genitive suffix to the string.
  ///
  /// If [proper_noun] is true, an apostrophe is added before the suffix.
  String makeGenitive({bool proper_noun = false}) {
    final lastLetter = __getLastLetter();
    final lastVowel = __getLastVowel();

    String word = this;

    if (proper_noun) word += "'";

    if (lastLetter["vowel"]) {
      word += "n";
    } else if (lastLetter["discontinious_hard_consonant_for_suffix"] &&
        proper_noun == false) {
      if (lastVowel["count"] >= 1 &&
          (!Constants.EXCEPTIONS.contains(this) || lastVowel["count"] == 1)) {
        word = word.substring(0, word.length - 1) +
            (lastLetter["soften_consonant_for_suffix"]); //ToDo: Check
      }
    }

    final minor = Constants.MINOR_HARMONY[lastVowel['letter']];

    word += "${minor}n";

    return word;
  }

  /// Adds the ablative suffix to the string.
  ///
  /// If [proper_noun] is true, an apostrophe is added before the suffix.
  String makeAblative({bool proper_noun = false}) {
    final lastLetter = __getLastLetter();
    final lastVowel = __getLastVowel();

    String word = this;

    if (proper_noun) word += "'";

    if (Constants.HARD_CONSONANTS.contains(lastLetter["letter"])) {
      word += "t";
    } else {
      word += "d";
    }

    if (lastVowel["tone"] == "front") {
      word += "an";
    } else {
      word += "en";
    }

    return word;
  }

  /// Adds the locative suffix to the string.
  ///
  /// If [proper_noun] is true, an apostrophe is added before the suffix.
  String makeLocative({bool proper_noun = false}) {
    final lastVowel = __getLastVowel();
    final lastLetter = __getLastLetter();

    String word = this;

    if (proper_noun) word += "'";

    if (Constants.HARD_CONSONANTS.contains(lastLetter["letter"])) {
      word += "t";
    } else {
      word += "d";
    }
    if (lastVowel["tone"] == "front") {
      word += "a";
    } else {
      word += "e";
    }

    return word;
  }

  /// Adds the possessive suffix to the string.
  ///
  /// [person] specifies the person (first, second, or third).
  /// [quantity] specifies the quantity (singular or plural).
  /// If [properNoun] is true, an apostrophe is added before the suffix.
  String possessiveAffix(
      {required Person person,
      required Quantity quantity,
      bool properNoun = false}) {
    String word = this;
    final lastLetter = __getLastLetter();
    final lastVowel = __getLastVowel();

    if (properNoun) word += "'";

    if ((person != Person.uc || person != Person.o) &&
        quantity != Quantity.plural) {
      if (lastLetter['discontinious_hard_consonant_for_suffix']) {
        if (lastVowel['count'] >= 1 &&
            (!Constants.EXCEPTIONS.contains(this) || lastVowel["count"] == 1)) {
          word = word.substring(0, word.length - 1) +
              lastLetter['soften_consonant_for_suffix'];
        }
      }
    }

    bool lastLetterIsVowel = Constants.VOWELS.contains(lastLetter['letter']);
    String letter = lastVowel['letter'];
    String minorHarmonyLetter = Constants.MINOR_HARMONY[letter] ?? "";

    if (quantity == Quantity.singular) {
      if (!lastLetterIsVowel) {
        word += minorHarmonyLetter;
      }
      if (person == Person.ben || person == Person.bir) {
        word += "m";
      } else if (person == Person.iki || person == Person.sen) {
        word += "n";
      }
    } else {
      if (person == Person.ben || person == Person.bir) {
        if (!lastLetterIsVowel) {
          word += minorHarmonyLetter;
        }
        word += "m";
        word += minorHarmonyLetter;
        word += "z";
      } else if (person == Person.iki || person == Person.sen) {
        if (!lastLetterIsVowel) {
          word += minorHarmonyLetter;
        }
        word += "n";
        word += minorHarmonyLetter;
        word += "z";
      } else {
        if (word.toLowerCase() == "ism") {
          word = "isim";
        }
        word = word.makePlural(proper_noun: false);
        word += minorHarmonyLetter;
      }
    }
    return word;
  }

  String applyNumberOrderSuffix({bool writeOut = false}) {
    int? numberInt = int.tryParse(this);
    String number = NumberUtils.numberToTurkishString(numberInt!);
    String ek = "";
    String template = "_nc_";

    final lastLetter = number.__getLastLetter();
    final lastVowel = number.__getLastVowel();

    if (lastLetter["vowel"]) {
      template = template.replaceFirst("_", "");
    }

    ek =
        template.replaceAll("_", Constants.MINOR_HARMONY[lastVowel["letter"]]!);

    if(writeOut){
      return "$number$ek";
    }
    return "$this'$ek";
  }
}
