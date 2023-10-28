import 'package:rick_morty_doubelv/locations/domain/entities/location_model.dart';
import 'package:rick_morty_doubelv/locations/infraestructure/models/locations_rickapi_response.dart';

class LocationssMapper {
  static List<LocationModel> locationsResponseapiToEntity(
      LocationsRickApiResponse data) {
    final listLocations = data.results.map((e) => e.toJson());

    return listLocations
        .map<LocationModel>((e) => LocationModel.fromJson(e))
        .toList();
  }

  static LocationModel locationApiToEntity(LocationApi loc) => LocationModel(
      id: loc.id,
      name: loc.name,
      type: loc.type,
      dimension: loc.dimension,
      residents: loc.residents,
      url: loc.url,
      created: loc.created);
}
