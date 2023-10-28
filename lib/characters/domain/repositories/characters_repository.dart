import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';

abstract class CharactersRepository {
  Future<CharactersResponse?> getCharacters(
      {int page = 1, required Map<String, String> data});
  Future<Character?> getOneCharacter({required int id});
}
