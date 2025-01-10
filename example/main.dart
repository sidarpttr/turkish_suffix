import 'package:flutter/material.dart';
import 'package:turkish_suffix/turkish_suffix.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              const TurkishSuffix(
                text: Text("Yalova"),
                ek: Ek.YONELME,
                proper_noun: true,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) => ListTile(
                          title:
                              TurkishSuffix.numberOrder(Text(index.toString())),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
