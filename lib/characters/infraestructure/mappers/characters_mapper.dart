import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';
import 'package:rick_morty_doubelv/characters/infraestructure/models/characters_response_api.dart';

class CharactersMapper {
  static CharactersResponse charactersResponseapiToEntity(
          CharactersResponseApi data) =>
      CharactersResponse.fromJson(data.toJson());

  static Character characterapiToEntity(Result data) => Character(
      id: data.id,
      name: data.name,
      status: data.status,
      species: data.species,
      type: data.type,
      gender: data.gender,
      origin: LocationCharacter.fromJson(data.origin.toJson()),
      location: LocationCharacter.fromJson(data.location.toJson()),
      image: data.image,
      episode: data.episode,
      url: data.url,
      created: data.created);
}
