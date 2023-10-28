import 'package:dio/dio.dart';
import 'package:rick_morty_doubelv/locations/domain/datasources/locations_datasource.dart';
import 'package:rick_morty_doubelv/locations/domain/entities/location_model.dart';
import 'package:rick_morty_doubelv/locations/infraestructure/mappers/locations_mapper.dart';
import 'package:rick_morty_doubelv/locations/infraestructure/models/locations_rickapi_response.dart';

class LocationsRickAppiDatasource extends LocationsDatasource {
  final dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api/"));

  @override
  Future<List<LocationModel>?> getLocations({int page = 1}) async {
    try {
      final result = await dio.get("location/?page=$page");
      if (result.statusCode == 200) {
        final response = LocationssMapper.locationsResponseapiToEntity(
            LocationsRickApiResponse.fromJson(result.data));
        return response;
      } else {
        return [];
      }
    } on DioException catch (_) {
      return [];
    }
  }

  @override
  Future<LocationModel?> getLocation({required int id}) async {
    try {
      final result = await dio.get("location/$id");
      if (result.statusCode == 200) {
        final response = LocationssMapper.locationApiToEntity(
            LocationApi.fromJson(result.data));
        return response;
      } else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    }
  }
}
