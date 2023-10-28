import 'package:rick_morty_doubelv/episodes/domain/datasources/episodes_datasource.dart';
import 'package:rick_morty_doubelv/episodes/domain/entities/episode_model.dart';
import 'package:rick_morty_doubelv/episodes/domain/repositories/episodes_repository.dart';

class EpisodesRepositoryImpl extends EpisodesRepository {
  final EpisodesDatsasource datasource;

  EpisodesRepositoryImpl({required this.datasource});

  @override
  Future<List<Episode>?> getEpisodes({int page = 1}) async {
    return await datasource.getEpisodes(page: page);
  }

  @override
  Future<Episode?> getOneEpisode({required int id}) async {
    return await datasource.getOneEpisode(id: id);
  }

  @override
  Future<List<Episode>?> getEpisodeByName({required String name}) async {
    return await datasource.getEpisodeByName(name: name);
  }
}
