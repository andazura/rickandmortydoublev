import 'package:rick_morty_doubelv/episodes/domain/entities/episode_model.dart';

abstract class EpisodesRepository {
  Future<List<Episode>?> getEpisodes({int page = 1});

  Future<Episode?> getOneEpisode({required int id});

  Future<List<Episode>?> getEpisodeByName({required String name});
}
