import 'package:biticon/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Biticoin());
}

class Biticoin extends StatelessWidget {
  const Biticoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cotação do Bitcoin",
      home: HomePage(),
    );
  }
}
