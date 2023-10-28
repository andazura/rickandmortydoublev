import 'package:rick_morty_doubelv/characters/domain/datasources/characters_datasource.dart';
import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';
import 'package:rick_morty_doubelv/characters/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CharactersDatasource datasource;

  CharactersRepositoryImpl({required this.datasource});

  @override
  Future<CharactersResponse?> getCharacters(
      {int page = 1, required Map<String, String> data}) async {
    return await datasource.getCharacters(page: page, data: data);
  }

  @override
  Future<Character?> getOneCharacter({required int id}) async {
    return await datasource.getOneCharacter(id: id);
  }
}
