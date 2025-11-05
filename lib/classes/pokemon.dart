import 'package:http/http.dart';
import 'package:pokemon_api_practice/extensions/string_casing.dart';
import 'dart:convert';

class Pokemon {
  int id;
  String name;
  String type;
  List<String> abilities;
  Map<String, int> stats;
  String sprite;
  String height;
  String weight;

  Pokemon(
    this.id,
    this.name,
    this.type,
    this.abilities,
    this.stats,
    this.sprite,
    this.height,
    this.weight,
  );

  static Future<Pokemon> fromNameOrId(String nameOrId) async {
    Response response = await get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$nameOrId'));
    if (response.statusCode != 200) {
      throw Exception('Pokemon "$nameOrId" was not found.');
    }
    Map data = jsonDecode(response.body);

    int id = data['id'];
    String name = data['name'].toString().capitalize();

    String type = '';
    for (var typeInData in data['types']) {
      String typeString = typeInData['type']['name'];
      type = type.isEmpty ? typeString : '$type $typeString';
    }
    type = type.capitalizeEach().replaceAll(' ', '/');

    List<String> abilities = [];
    for (var ability in data['abilities']) {
      abilities.add(ability['ability']['name'].toString().replaceAll('-', ' ').capitalizeEach());
    }

    Map<String, int> stats = {};
    for (var stat in data['stats']) {
      stats[stat['stat']['name']] = stat['base_stat'];
    }

    String sprite = data['sprites']['front_default'];
    String height = (data['height'] * 10).toString();
    String weight = (data['weight'] / 10).toString();

    return Pokemon(id, name, type, abilities, stats, sprite, height, weight);
  }
}