import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:doc_qa_front_end/screens/home/home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: FlexThemeData.light(scheme: FlexScheme.blackWhite),
    darkTheme: FlexThemeData.dark(scheme: FlexScheme.blackWhite),
    themeMode: ThemeMode.light,
  ));
}

// sandbox
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox'),
    );
  }
}
