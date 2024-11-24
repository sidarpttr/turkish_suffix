class EkHatasi extends Error {
  final String message;

  EkHatasi(this.message);

  @override
  String toString() {
    return "Ek Hatası: $message";
  }
}