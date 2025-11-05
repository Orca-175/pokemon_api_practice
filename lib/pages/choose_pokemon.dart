import 'package:flutter/material.dart';
import 'package:pokemon_api_practice/classes/pokemon.dart';

class ChoosePokemon extends StatefulWidget {
  const ChoosePokemon({super.key});

  @override
  State<ChoosePokemon> createState() => _ChoosePokemonState();
}

class _ChoosePokemonState extends State<ChoosePokemon> {
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Pokemon!'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: Column(
            children: [
              SizedBox(height: 80.0),
              TextField(
                controller: name,
              ),
              SizedBox(height: 12.0),
              Text('Name or ID'),
              SizedBox(height: 12.0),
              FilledButton(
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  try {
                    Pokemon pokemon = await Pokemon.fromNameOrId(name.text);
                    if (mounted) {
                      navigator.pushReplacementNamed('/home', arguments: pokemon);
                    }
                  } catch (exception) {
                    if (mounted) {
                      navigator.pushReplacementNamed('/home', arguments: exception);
                    }
                  }
                }, 
                child: Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}