import 'package:flutter/material.dart';
import 'package:shop/views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.yellow,
        fontFamily: 'Lato'
      ),
      home: ProductOverviewScreen(),
    );
  }
}