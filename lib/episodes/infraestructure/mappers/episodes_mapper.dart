import 'package:rick_morty_doubelv/episodes/domain/entities/episode_model.dart';
import 'package:rick_morty_doubelv/episodes/infraestructure/models/episodes_rickapi_response.dart';

class EpisodesMapper {
  static List<Episode> episodesResponseapiToEntity(List<EpisodesResult> data) {
    return data
        .map((episode) => Episode(
            id: episode.id,
            name: episode.name,
            airDate: episode.airDate,
            episode: episode.episode,
            characters: episode.characters,
            url: episode.url,
            created: episode.created))
        .toList();
  }

  static Episode episodeApiToEntity(EpisodesResult episode) => Episode(
      id: episode.id,
      name: episode.name,
      airDate: episode.airDate,
      episode: episode.episode,
      characters: episode.characters,
      url: episode.url,
      created: episode.created);
}
