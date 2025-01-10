// ignore_for_file: constant_identifier_names, file_names

/// Enum representing different types of suffixes in Turkish.
enum Ek {
  /// Mastar Eki (Infinitive Suffix)
  MASTAR,

  /// Çoğul Eki (Plural Suffix)
  COGUL,

  /// Belirtme Eki (Accusative Suffix)
  BELIRTME,

  /// Yönelme Eki (Dative Suffix)
  YONELME,

  /// Tamlayan Eki (Genitive Suffix)
  TAMLAYAN,

  /// Ayrılma Eki (Ablative Suffix)
  AYRILMA,

  /// Bulunma Eki (Locative Suffix)
  BULUNMA,

  /// İyelik Eki (Possessive Suffix)
  IYELIK,

  /// Yapım Eki -mak (Infinitive Suffix)
  MAK,

  /// Çoğul Eki -lar (Plural Suffix)
  LAR,

  /// Belirtme Eki -ı (Accusative Suffix)
  I,

  /// Yönelme Eki -a (Dative Suffix)
  A,

  /// Tamlayan Eki -nın (Genitive Suffix)
  NIN,

  /// Ayrılma Eki -dan (Ablative Suffix)
  DAN,

  /// Bulunma Eki -da (Locative Suffix)
  DA,

  /// İyelik Eki -ım (Possessive Suffix)
  IM,

  /// Sıralama Eki (Ordinal Suffix)
  SIRALAMA
}

/// Enum representing different persons for possessive suffixes.
enum Person {
  /// First person singular (ben)
  ben,

  /// Second person singular (sen)
  sen,

  /// Third person singular (o)
  o,

  /// First person plural (bir)
  bir,

  /// Second person plural (iki)
  iki,

  /// Third person plural (uc)
  uc
}

/// Enum representing quantity for possessive suffixes.
enum Quantity {
  /// Singular quantity
  singular,

  /// Plural quantity
  plural
}
