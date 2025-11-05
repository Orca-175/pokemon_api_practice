import 'package:flutter/material.dart';
import 'package:pokemon_api_practice/pages/home.dart';
import 'package:pokemon_api_practice/pages/choose_pokemon.dart';
import 'package:pokemon_api_practice/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/search': (context) => ChoosePokemon(),
      },
    );
  }
}
