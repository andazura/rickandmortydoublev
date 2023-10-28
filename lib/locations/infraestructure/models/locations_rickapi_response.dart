import 'dart:convert';

LocationsRickApiResponse locationsResponseApiFromJson(String str) =>
    LocationsRickApiResponse.fromJson(json.decode(str));

String locationsResponseApiToJson(LocationsRickApiResponse data) =>
    json.encode(data.toJson());

class LocationsRickApiResponse {
  final Info info;
  final List<LocationApi> results;

  LocationsRickApiResponse({
    required this.info,
    required this.results,
  });

  factory LocationsRickApiResponse.fromJson(Map<String, dynamic> json) =>
      LocationsRickApiResponse(
        info: Info.fromJson(json["info"]),
        results: List<LocationApi>.from(
            json["results"].map((x) => LocationApi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
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

class LocationApi {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  LocationApi({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationApi.fromJson(Map<String, dynamic> json) => LocationApi(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
