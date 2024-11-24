class Constants {
  static const String VOWELS = "aıoöuüei";
  static const String FRONT_VOWELS = "aıou";
  static const String BACK_VOWELS = "eiöü";
  static const String HARD_CONSONANTS = "fstkçşhp";
  static const String DISCONTINIOUS_HARD_CONSONANTS = "pçtk";
  static const String SOFTEN_DHC = "bcdğ";
  static const String DISCONTINIOUS_HARD_CONSONANTS_AFTER_SUFFIX = "pçk";
  static const String SOFTEN_DHC_AFTER_SUFFIX = "bcğ";

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
}
