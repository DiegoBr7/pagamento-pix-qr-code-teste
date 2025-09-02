import 'package:flutter/material.dart';
import 'package:pix/pages/doacao_pix.dart';
import 'package:pix/pages/pix_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tira o banner "debug"
      home: DoacaoPix(), // chama a tela doacao_pix.dart
    );
  }
}
