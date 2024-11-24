# Turkish Suffix Extension for Dart 0.0.1

This Dart package provides a set of extensions for handling Turkish suffixes. It includes methods for adding various grammatical suffixes to Turkish words, making it easier to work with Turkish language rules in your Dart applications.

## Features

## Getting started

To start using this package, add it to your `pubspec.yaml` file:

````yaml
dependencies:
  turkish_suffix: ^0.0.1
````

## Usage

```dart

//iki ek kullanımı da aynı şeyi ifade ediyor
TurkishSuffix(text:Text("sidar"), ek: Ek.AYRILMA, proper_noun: true); //sidar'dan
TurkishSuffix(text:Text("deneme"), ek: Ek.DAN,); //denemeden

````
