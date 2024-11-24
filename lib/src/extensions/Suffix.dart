// ignore: file_names
import 'package:turkish_suffix/src/constants/Ekler.dart';
import 'package:turkish_suffix/src/enums/Ekler.dart';

extension TurkishSuffixExtension on String {
  String __getLastWord() => toLowerCase().split(" ")[-1];

  String __trim() => replaceAll(" ", "");

  List<dynamic> __getVowels() {
    var list = [];
    for (var vovel in Constants.VOWELS.split("")) {
      if (contains(vovel)) {
        list.add(vovel);
      }
    }
    return list;
  }

  String __toLower() => replaceAll("I", "ı").replaceAll("İ", "i").toLowerCase();

  Map<dynamic, dynamic> __getLastVowel() {
    String letter = "";
    String tone = "";
    int count = 0;

    var word = __toLower();

    for (var let in word.split("")) {
      if (Constants.FRONT_VOWELS.contains(let)) {
        count++;
        letter = let;
        tone = "front";
      } else if (Constants.BACK_VOWELS.contains(let)) {
        count++;
        letter = let;
        tone = "back";
      }
    }

    return {"letter": letter, "tone": tone, "count": count};
  }

  Map<String, dynamic> __getLastLetter() {
    String word = __toLower();
    Map<String, dynamic> returnData = {
      "vowel": false,
      "consonant": false,
      "hard_consonant": false,
      "discontinious_hard_consonant_for_suffix": false,
      "soften_consonant_for_suffix": false,
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

  String makeInfinitive() =>
      __getLastVowel()["tone"] == "front" ? "${this}mak" : "${this}mek";

  String makePlural({bool proper_noun = false}) {
    String word = this;
    if (proper_noun) {
      word += "'";
    }
    return word.__getLastVowel()["tone"] == "front"
        ? "${word}lar"
        : "${word}ler";
  }

  String makeAccusative({bool proper_noun = false}) {
    String lowerword = __toLower();
    String word = this;
    if (lowerword == "o") {
      return proper_noun ? "O'nu" : "onu";
    } else {
      final lastLetter = __getLastLetter();
      final lastVowel = __getLastVowel();

      if (proper_noun) word += "'";

      print(lastVowel);
      print(lastLetter);

      if (lastLetter["vowel"]) {
        word += "y";
      } else if (lastLetter["discontinious_hard_consonant_for_suffix"] &&
          !proper_noun) {
        if (lastVowel["count"] > 1) {
          word = word.substring(0, word.length - 1) +
              (lastLetter["soften_consonant_for_suffix"]);
        }
      }

      word = "$word${Constants.MINOR_HARMONY[lastVowel["letter"]]}";
    }

    return word;
  }

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
      } else if (lastLetter["discontinious_hard_consonant_for_suffix"]) {
        if (lastVowel["count"] > 1 && !proper_noun) {
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

  String makeGenitive({bool proper_noun = false}) {
    final lastLetter = __getLastLetter();
    final lastVowel = __getLastVowel();

    String word = this;

    if (proper_noun) word += "'";

    if (lastLetter["vowel"]) {
      word += "n";
    } else if (lastLetter["discontinious_hard_consonant_for_suffix"] &&
        proper_noun == false) {
      if (lastVowel["count"] > 1) {
        word = word.substring(0, word.length - 1) +
            (lastLetter["soften_consonant_for_suffix"]); //ToDo: Check
      }
    }

    final minor = Constants.MINOR_HARMONY[lastVowel['letter']];

    word += "${minor}n";

    return word;
  }

  String makeAblative({bool proper_noun = false}) {
    final lastLetter = __getLastLetter();
    final lastVowel = __getLastVowel();

    String word = this;

    if (proper_noun) word += "'";

    if (Constants.HARD_CONSONANTS.contains(lastLetter["letter"])) { //TODO: check sido
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
        if (lastVowel['vowel_count'] > 1) {
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
}