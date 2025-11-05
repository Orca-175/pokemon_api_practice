import 'package:flutter/material.dart';

class ChoosePokemon extends StatefulWidget {
  const ChoosePokemon({super.key});

  @override
  State<ChoosePokemon> createState() => _ChoosePokemonState();
}

class _ChoosePokemonState extends State<ChoosePokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: Text('Choose Pokemon Screen'),
    );
  }
}