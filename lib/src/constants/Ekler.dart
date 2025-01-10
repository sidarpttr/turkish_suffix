// ignore_for_file: constant_identifier_names, file_names

/// A class that contains constants used for handling Turkish suffixes.
class Constants {
  /// A string containing all Turkish vowels.
  static const String VOWELS = "aıoöuüei";

  /// A string containing front vowels in Turkish.
  static const String FRONT_VOWELS = "aıou";

  /// A string containing back vowels in Turkish.
  static const String BACK_VOWELS = "eiöü";

  /// A string containing hard consonants in Turkish.
  static const String HARD_CONSONANTS = "fstkçşhp";

  /// A string containing discontinious hard consonants in Turkish.
  static const String DISCONTINIOUS_HARD_CONSONANTS = "pçtk";

  /// A string containing softened versions of discontinious hard consonants.
  static const String SOFTEN_DHC = "bcdğ";

  /// A string containing discontinious hard consonants after suffixes.
  static const String DISCONTINIOUS_HARD_CONSONANTS_AFTER_SUFFIX = "pçk";

  /// A string containing softened versions of discontinious hard consonants after suffixes.
  static const String SOFTEN_DHC_AFTER_SUFFIX = "bcğ";

  /// A map for minor vowel harmony in Turkish.
  static const Map<String, String> MINOR_HARMONY = {
    'a': 'ı',
    'e': 'i',
    'ö': 'ü',
    'o': 'u',
    'ı': 'ı',
    'i': 'i',
    'u': 'u',
    'ü': 'ü'
  };

  /// A map for vowel harmony for present tense suffixes in Turkish.
  static const Map<String, String> HARMONY_FOR_PRESENT_FIRST = {
    'a': 'a',
    'e': 'e',
    'ö': 'e',
    'o': 'a',
    'ı': 'a',
    'i': 'e',
    'u': 'a',
    'ü': 'e'
  };

  /// A map for vowel harmony for present tense suffixes in Turkish.
  static const Map<String, String> HARMONY_FOR_PRESENT = {
    'e': 'i',
    'i': 'e',
    'ö': 'ü',
    'ü': 'ü',
    'a': 'ı',
    'u': 'u',
    'o': 'ı',
    'ı': 'a',
  };

  /// A list of exceptions for Turkish suffix rules.
  static const List<String> EXCEPTIONS = [
    "ahval",
    "akropol",
    "alkol",
    "antisosyal",
    "ametal",
    "amiral",
    "ampul",
    "anormal",
    "bandrol",
    "bemol",
    "beşamol",
    "bilkat",
    "cemaat",
    "cemal",
    "deccal",
    "dikkat",
    "ekol",
    "ekümenapol",
    "emsal",
    "enstrümental",
    "enterasyonal",
    "faal",
    "faul",
    "final",
    "general",
    "glikol",
    "gol",
    "hakikat",
    "hal",
    "harf",
    "hayal",
    "hilal",
    "hiperbol",
    "hol",
    "integral",
    "iştigal",
    "istikbal",
    "istiklal",
    "jurnal",
    "kabul",
    "kalp",
    "kanaat",
    "kapital",
    "karambol",
    "katedral",
    "kefal",
    "kemal",
    "kıraat",
    "kolestrol",
    "kontrol",
    "koramiral",
    "korgeneral",
    "legal",
    "liberal",
    "liyakat",
    "lokal",
    "mahmul",
    "mamul",
    "mahsul",
    "maktul",
    "makbul",
    "makul",
    "mareşal",
    "meal",
    "menkul",
    "mentol",
    "meral",
    "meşakkat",
    "meşgul",
    "metal",
    "materyal",
    "metropol",
    "mineral",
    "misal",
    "moral",
    "müzikal",
    "müzikhol",
    "nasyonal",
    "normal",
    "ohal",
    "oramiral",
    "orgeneral",
    "orijinal",
    "oryantal",
    "oval",
    "parabol",
    "paranormal",
    "pastoral",
    "perhidrol",
    "petrol",
    "radikal",
    "refakat",
    "resital",
    "resul",
    "rol",
    "saat",
    "sadakat",
    "santral",
    "sansasyonal",
    "şefkat",
    "şevval",
    "sinyal",
    "sosyal",
    "spesiyal",
    "sual",
    "tefal",
    "termal",
    "terminal",
    "total",
    "trambol",
    "tropikal",
    "tuğamiral",
    "tuğgeneral",
    "tümamiral",
    "tümgeneral",
    "turnusol",
    "tuval",
    "usul",
    "zeval",
    "ziraat"
  ];
}
