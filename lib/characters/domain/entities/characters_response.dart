import 'dart:convert';

CharactersResponse charactersResponseFromJson(String str) =>
    CharactersResponse.fromJson(json.decode(str));

String charactersResponseToJson(CharactersResponse data) =>
    json.encode(data.toJson());

class CharactersResponse {
  final InfoCharactersResponse info;
  final List<Character> results;

  CharactersResponse({
    required this.info,
    required this.results,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      CharactersResponse(
        info: InfoCharactersResponse.fromJson(json["info"]),
        results: List<Character>.from(
            json["results"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class InfoCharactersResponse {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  InfoCharactersResponse({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory InfoCharactersResponse.fromJson(Map<String, dynamic> json) =>
      InfoCharactersResponse(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationCharacter origin;
  final LocationCharacter location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: LocationCharacter.fromJson(json["origin"]),
        location: LocationCharacter.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}

class LocationCharacter {
  final String name;
  final String url;

  LocationCharacter({
    required this.name,
    required this.url,
  });

  factory LocationCharacter.fromJson(Map<String, dynamic> json) =>
      LocationCharacter(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
