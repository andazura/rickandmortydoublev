import 'package:dio/dio.dart';
import 'package:rick_morty_doubelv/episodes/domain/datasources/episodes_datasource.dart';
import 'package:rick_morty_doubelv/episodes/domain/entities/episode_model.dart';
import 'package:rick_morty_doubelv/episodes/infraestructure/mappers/episodes_mapper.dart';
import 'package:rick_morty_doubelv/episodes/infraestructure/models/episodes_rickapi_response.dart';

class EpisodesRickAppiDatasource extends EpisodesDatsasource {
  final dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api/"));

  @override
  Future<List<Episode>?> getEpisodes({int page = 1}) async {
    try {
      final result = await dio.get("episode/?page=$page");
      if (result.statusCode == 200) {
        final response = EpisodesMapper.episodesResponseapiToEntity(
            EpisodesResponseApi.fromJson(result.data).results);
        return response;
      } else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<Episode?> getOneEpisode({required int id}) async {
    try {
      final result = await dio.get("episode/$id");
      if (result.statusCode == 200) {
        final response = EpisodesMapper.episodeApiToEntity(
            EpisodesResult.fromJson(result.data));
        return response;
      } else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    }
  }

  @override
  Future<List<Episode>?> getEpisodeByName({required String name}) async {
    try {
      final result = await dio.get("episode", queryParameters: {"name": name});
      if (result.statusCode == 200) {
        final response = EpisodesMapper.episodesResponseapiToEntity(
            EpisodesResponseApi.fromJson(result.data).results);
        return response;
      } else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    }
  }
}
