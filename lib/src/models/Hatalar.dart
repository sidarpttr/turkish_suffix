// ignore_for_file: file_names

class EkHatasi extends Error {
  final String message;

  EkHatasi(this.message);

  @override
  String toString() {
    return "Ek Hatası: $message";
  }
}