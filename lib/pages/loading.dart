import 'package:flutter/material.dart';
import 'package:pokemon_api_practice/classes/pokemon.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getPokemon() async {
    try {
      Pokemon pokemon = await Pokemon.fromNameOrId('charizard');
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home', arguments: pokemon);
      }
    } catch (exception) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home', arguments: exception);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}