# Flutter Turkish Suffix Extension

This Dart package provides a set of extensions for handling Turkish suffixes. It includes methods for adding various grammatical suffixes to Turkish words, making it easier to work with Turkish language rules in your Dart applications.

## Features
- **Infinitive Suffix**: Add the infinitive suffix to a verb.
- **Plural Suffix**: Add the plural suffix to a noun.
- **Accusative Suffix**: Add the accusative suffix to a noun.
- **Dative Suffix**: Add the dative suffix to a noun.
- **Genitive Suffix**: Add the genitive suffix to a noun.
- **Ablative Suffix**: Add the ablative suffix to a noun.
- **Locative Suffix**: Add the locative suffix to a noun.
- **Possessive Affix**: Add the possessive affix to a noun based on person and quantity.

## Getting started

## Usage

You can use The TurkishSuffix widget to automatically apply suffixes to Text widgets:
```dart

//iki ek kullanımı da aynı şeyi ifade ediyor
TurkishSuffix(text:Text("sidar"), ek: Ek.AYRILMA, proper_noun: true); //sidar'dan
TurkishSuffix(text:Text("deneme"), ek: Ek.DAN,); //denemeden

````
