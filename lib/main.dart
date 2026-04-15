import 'package:flutter/material.dart';
import 'package:teknolojimarket/appwiew.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeknolojiMarket',
      debugShowCheckedModeBanner: false,
      home: DestinationCarrousel(),
      


      
      )
      
    ;
  }
}