import 'dart:convert';

EpisodesResponseApi episodesResponseApiFromJson(String str) =>
    EpisodesResponseApi.fromJson(json.decode(str));

String episodesResponseApiToJson(EpisodesResponseApi data) =>
    json.encode(data.toJson());

class EpisodesResponseApi {
  final Info info;
  final List<EpisodesResult> results;

  EpisodesResponseApi({
    required this.info,
    required this.results,
  });

  factory EpisodesResponseApi.fromJson(Map<String, dynamic> json) =>
      EpisodesResponseApi(
        info: Info.fromJson(json["info"]),
        results: List<EpisodesResult>.from(
            json["results"].map((x) => EpisodesResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  final int count;
  final int pages;

  Info({
    required this.count,
    required this.pages,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
      };
}

class EpisodesResult {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  EpisodesResult({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodesResult.fromJson(Map<String, dynamic> json) => EpisodesResult(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
