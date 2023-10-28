import 'package:flutter/material.dart';

import 'package:rick_morty_doubelv/episodes/domain/entities/episode_model.dart';
import 'package:rick_morty_doubelv/episodes/infraestructure/datasources/episodes_rickapi_datasource.dart';
import 'package:rick_morty_doubelv/episodes/infraestructure/repositories/episodes_repository_impl.dart';

class EpisodesProvider extends ChangeNotifier {
  final EpisodesRepositoryImpl repository =
      EpisodesRepositoryImpl(datasource: EpisodesRickAppiDatasource());

  EpisodesProvider() {
    getAllEpisodes();
  }

  bool _isloading = false;

  set loading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  bool get loading => _isloading;

  List<Episode> episodes = [];
  List<Episode> filterEpisodes = [];

  int page = 1;
  late Episode _selectedEpisode;

  bool _isSearchdMode = false;

  bool get searchMode => _isSearchdMode;

  set searchMode(bool value) {
    _isSearchdMode = value;
    notifyListeners();
  }

  set episode(Episode value) {
    _selectedEpisode = value;
    notifyListeners();
  }

  Episode get episode => _selectedEpisode;

  getAllEpisodes() async {
    loading = true;
    final episodesresponse = await repository.getEpisodes(page: page);
    if (episodesresponse == null) {
      loading = false;
      return;
    }
    if (episodesresponse.isNotEmpty) {
      episodes.addAll(episodesresponse);
      _selectedEpisode = episodes.first;
      page++;
      loading = false;
      notifyListeners();
    }
  }

  getOneepisode(int id) async {
    final episoderesponse = await repository.getOneEpisode(id: id);
    if (episoderesponse != null) {
      _selectedEpisode = episoderesponse;
      notifyListeners();
    }
  }

  getEpisodesByName(String name) async {
    loading = true;
    final episodesresponse = await repository.getEpisodeByName(name: name);
    if (episodesresponse != null) {
      filterEpisodes = episodesresponse;
      _selectedEpisode = filterEpisodes.first;
      notifyListeners();
    } else {
      filterEpisodes = [];
    }
    loading = false;
  }
}
