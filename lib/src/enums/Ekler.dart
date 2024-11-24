/// Ekler enum'u, Türkçe dil bilgisi eklerini temsil eder.
enum Ek {
  /// Mastar Eki
  MASTAR,

  /// Çoğul Eki
  COGUL,

  /// Belirtme Eki
  BELIRTME,

  /// Yönelme Eki
  YONELME,

  /// Tamlayan Eki
  TAMLAYAN,

  /// Ayrılma Eki
  AYRILMA,

  /// Bulunma Eki
  BULUNMA,

  /// İyelik Eki
  IYELIK,

/////
  ///
  /// EKLERİN KENDLİLERİ

  /// Yapım Eki -mak
  MAK,

  /// Çoğul Eki -lar
  LAR,

  /// Belirtme Eki -ı
  I,

  /// Yönelme Eki -a
  A,

  /// Tamlayan Eki -nın
  NIN,

  /// Ayrılma Eki -dan
  DAN,

  /// Bulunma Eki -da
  DA,

  /// İyelik Eki -ım
  IM
}

// ignore: unused_field, constant_identifier_names
enum Person { ben, sen, o, bir, iki, uc }

enum Quantity { singular, plural }
