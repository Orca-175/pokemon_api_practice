import 'package:flutter/material.dart';
import 'package:pokemon_api_practice/classes/pokemon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)?.settings.arguments;
    if (argument is !Pokemon) {
      return HomeTemplate(
        children: [
          SizedBox(height: 60.0),
          Text(argument.toString().substring(10), style: TextStyle(fontSize: 20.0)),
        ],
      );
    }

    pokemon = argument;
    return HomeTemplate(
      children: [
        Image.network(pokemon.sprite, scale: 0.50),
        Column(
          children: [
            Text('#${pokemon.id}'),
            Text(pokemon.name, style: TextStyle(fontSize: 30.0)),
            Text(pokemon.type),
          ],
        ),
        SizedBox(height: 30.0),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final (index, ability) in pokemon.abilities.indexed) 
                  if (index < pokemon.abilities.length - 1) 
                    Text('$ability | ', style: TextStyle(fontSize: 20.0)) 
                  else
                    Text(ability, style: TextStyle(fontSize: 20.0)) 
              ],
            ),
            Text('Abilities'),
          ],
        ),
        Divider(height: 40.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 70,
              child: Column(
                children: [
                  LabeledField(label: 'HP', data: pokemon.stats['hp'].toString()),
                  LabeledField(label: 'ATK', data: pokemon.stats['attack'].toString()),
                  LabeledField(label: 'DEF', data: pokemon.stats['defense'].toString()),
                ]
              ),
            ),
            SizedBox(width: 100.0),
            SizedBox(
              width: 70,
              child: Column(
                children: [
                  LabeledField(label: 'SP. ATK', data: pokemon.stats['special-attack'].toString()),
                  LabeledField(label: 'SP. DEF', data: pokemon.stats['special-defense'].toString()),
                  LabeledField(label: 'SPD', data: pokemon.stats['speed'].toString()),
                ],
              ),
            ),
          ]
        ),
        Text('Base Stats'),
        Divider(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 95.0,
              child: LabeledField(label: 'Height', data: '${pokemon.height} cm'),
            ),
            SizedBox(width: 75.0),
            SizedBox(
              width: 95.0,
              child: LabeledField(label: 'Weight', data: '${pokemon.weight} kg')
            ),
          ],
        ),
      ]
    );
  }
}

class HomeTemplate extends StatelessWidget {
  final List<Widget> children;
  const HomeTemplate({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 40.0),
                FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  }, 
                  child: Row(
                    mainAxisSize: MainAxisSize.min, 
                    children: [Icon(Icons.search), SizedBox(width: 10.0), Text('Search Pokemon')]
                  ),
                ),
                ...children
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LabeledField extends StatelessWidget {
  final String label;
  final String data;
  final CrossAxisAlignment crossAxisAlignment;

  const LabeledField({
    super.key, 
    required this.label, 
    required this.data, 
    this.crossAxisAlignment = CrossAxisAlignment.center
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(data, style: TextStyle(fontSize: 20.0)),
        Text(label),
      ],
    );
  }
}