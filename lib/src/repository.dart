import 'package:flutter/foundation.dart';
import 'package:restbase/restbase.dart';
import 'package:restbase_test/src/star_wars_character.dart';

class TestApi extends Rest {
  @override
  String get restUrl => "https://swapi.dev/api/";

  Future<List<StarWarsCharacter>> getAllSWCharacters() async {
    List<StarWarsCharacter> characters = [];
    try {
      final result = await get('people/');
      debugPrint("${result['results']}");

      if (result != null) {
        for (final r in result['results']) {
          characters.add(StarWarsCharacter.fromJson(r));
        }
      }
    } catch (e) {
      debugPrint("$e");
    }
    return characters;
  }
}
