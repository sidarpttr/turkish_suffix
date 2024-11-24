import 'package:flutter/material.dart';
import 'package:turkish_suffix/turkish_suffix.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: TurkishSuffix(
            text: Text("Yalova"),
            ek: Ek.YONELME,
            proper_noun: true,
          ),
        ),
      ),
    );
  }
}
