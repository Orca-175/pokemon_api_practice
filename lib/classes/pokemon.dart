import 'package:http/http.dart';
import 'package:pokemon_api_practice/extensions/string_casing.dart';
import 'dart:convert';

class Pokemon {
  int id = 0;
  String name;
  String type = '';
  List<String> abilities = [];
  Map<String, int> stats = {};
  String sprite = '';
  String height = '';
  String weight = '';

  Pokemon({required this.name});

  Future<void> getPokemon() async {
    Response response = await get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
    if (response.statusCode != 200) {
      throw Exception('Pokemon "$name" was not found.');
    }
    Map data = jsonDecode(response.body);
    

    id = data['id'];
    name = data['name'].toString().capitalize();

    for (var typeInData in data['types']) {
      type = '$type ${typeInData['type']['name'].toString().capitalize()}';
    }
    type = type.trim().replaceAll(' ', '/');

    for (var ability in data['abilities']) {
      abilities.add(ability['ability']['name'].toString().replaceAll('-', ' ').capitalizeEach());
    }

    for (var stat in data['stats']) {
      stats[stat['stat']['name']] = stat['base_stat'];
    }

    sprite = data['sprites']['front_default'];
    height = (data['height'] * 10).toString();
    weight = (data['weight'] / 10).toString();
  }
}