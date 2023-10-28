import 'package:rick_morty_doubelv/locations/domain/entities/location_model.dart';

abstract class LocationsRepository {
  Future<List<LocationModel>?> getLocations({int page = 1});
  Future<LocationModel?> getLocation({required int id});
}
