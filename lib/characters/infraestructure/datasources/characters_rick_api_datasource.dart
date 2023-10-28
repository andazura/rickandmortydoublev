import 'package:dio/dio.dart';
import 'package:rick_morty_doubelv/characters/domain/datasources/characters_datasource.dart';
import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';
import 'package:rick_morty_doubelv/characters/infraestructure/mappers/characters_mapper.dart';
import 'package:rick_morty_doubelv/characters/infraestructure/models/characters_response_api.dart';

class CharactersRickApiDatasource extends CharactersDatasource {
  final dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api/"));

  @override
  Future<CharactersResponse?> getCharacters(
      {int page = 1, required Map<String, String> data}) async {
    try {
      final result =
          await dio.get("character/?page=$page", queryParameters: data);
      if (result.statusCode == 200) {
        final characters = CharactersResponse.fromJson(result.data);
        return characters.info.count > 0 ? characters : null;
      } else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<Character?> getOneCharacter({required int id}) async {
    try {
      final result = await dio.get("character/$id");
      if (result.statusCode == 200) {
        return CharactersMapper.characterapiToEntity(
            Result.fromJson(result.data));
      } else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    }
  }
}
