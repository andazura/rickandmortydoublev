import 'package:flutter/material.dart';

import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';
import 'package:rick_morty_doubelv/characters/infraestructure/datasources/characters_rick_api_datasource.dart';
import 'package:rick_morty_doubelv/characters/infraestructure/repositories/characters_repository_impl.dart';

class CharactersProvider extends ChangeNotifier {
  final CharactersRepositoryImpl repository =
      CharactersRepositoryImpl(datasource: CharactersRickApiDatasource());

  CharactersProvider() {
    getAllCharacters();
  }

  int get page => _pageactual;

  Map<String, String> _query = {};

  set queryFecth(Map<String, String> query) {
    _query = query;
    notifyListeners();
  }

  Map<String, String> get queryFecth => _query;

  CharactersResponse? _characters;
  CharactersResponse? get characters => _characters;
  bool isloading = false;
  Map<int, CharactersResponse> _pagesvisited = {};
  int _pageactual = 1;

  late Character _selectedCharacter;

  set character(Character value) {
    _selectedCharacter = value;
    notifyListeners();
  }

  Character get character => _selectedCharacter;

  set page(int valor) {
    _pageactual = valor;
    getCharactersPage(page: valor, data: _query);
  }

  Future getCharactersPage(
      {required int page, required Map<String, String> data}) async {
    isloading = true;
    if (_pagesvisited.containsKey(page)) {
      _characters = _pagesvisited[page];
      isloading = false;
      notifyListeners();
      return;
    }
    await getAllCharacters(page: page);
  }

  Future getAllCharacters({int page = 1}) async {
    isloading = true;
    _characters = await repository.getCharacters(page: page, data: _query);
    if (_characters != null) {
      _pagesvisited[page] = _characters!;
    }
    isloading = false;
    notifyListeners();
  }

  Future getCharacter(int id) async {
    final result = await repository.getOneCharacter(id: id);
    if (result != null) {
      _selectedCharacter = result;
      notifyListeners();
    }
  }

  Future filterCharacters() async {
    final result = await repository.getCharacters(data: _query);
    if (result != null) {
      _characters = result;
      _pagesvisited = {};
      notifyListeners();
    }
  }
}
