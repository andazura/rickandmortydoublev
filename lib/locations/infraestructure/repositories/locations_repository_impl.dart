import 'package:rick_morty_doubelv/locations/domain/datasources/locations_datasource.dart';
import 'package:rick_morty_doubelv/locations/domain/entities/location_model.dart';
import 'package:rick_morty_doubelv/locations/domain/repositories/locations_repository.dart';

class LocationsRepositoryImpl extends LocationsRepository {
  final LocationsDatasource datasource;

  LocationsRepositoryImpl({required this.datasource});

  @override
  Future<List<LocationModel>?> getLocations({int page = 1}) async {
    return await datasource.getLocations(page: page);
  }

  @override
  Future<LocationModel?> getLocation({required int id}) async {
    return await datasource.getLocation(id: id);
  }
}
