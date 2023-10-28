import 'package:flutter/material.dart';

import 'package:rick_morty_doubelv/locations/domain/entities/location_model.dart';
import 'package:rick_morty_doubelv/locations/infraestructure/datasources/locations_rickapi_datasource.dart';
import 'package:rick_morty_doubelv/locations/infraestructure/repositories/locations_repository_impl.dart';

class LocationsProvider extends ChangeNotifier {
  final LocationsRepositoryImpl repository =
      LocationsRepositoryImpl(datasource: LocationsRickAppiDatasource());

  LocationsProvider() {
    getAllLocations();
  }

  List<LocationModel> locations = [];
  int page = 1;
  late LocationModel _selectedLocation;

  String _sort = "asc";
  String get sortmode => _sort;

  set sortmode(String value) {
    _sort = value;
    notifyListeners();
  }

  bool _isloading = false;

  set loading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  bool get loading => _isloading;

  set location(LocationModel value) {
    _selectedLocation = value;
    notifyListeners();
  }

  LocationModel get location => _selectedLocation;

  getAllLocations() async {
    loading = true;
    final locationsresponse = await repository.getLocations(page: page);
    loading = false;
    if (locationsresponse!.isNotEmpty) {
      locations.addAll(locationsresponse);
      _selectedLocation = locations.first;
      page++;
      notifyListeners();
    }
  }

  getOneLocation(int id) async {
    final locationresponse = await repository.getLocation(id: id);
    if (locationresponse != null) {
      _selectedLocation = locationresponse;
      notifyListeners();
    }
  }

  sortLocationsByName() {
    if (_sort == "asc") {
      locations.sort((a, b) => a.name.compareTo(b.name));
    } else {
      locations.sort((a, b) => b.name.compareTo(a.name));
    }
    notifyListeners();
  }
}
