import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/locations/domain/entities/location_model.dart';
import 'package:rick_morty_doubelv/presentation/providers/locations_provider.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final charactersPorvider = Provider.of<LocationsProvider>(context);
    final location = charactersPorvider.location;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
          style: rickTextStyle45,
        ),
      ),
      body: Column(children: [
        _BodyLocation(location: location),
        Expanded(child: ListCharacters(characters: location.residents))
      ]),
    );
  }
}

class _BodyLocation extends StatelessWidget {
  final LocationModel location;
  const _BodyLocation({required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Dimension",
            style: rickTextStyle24.copyWith(color: colorYellow),
          ),
          const SizedBox(height: 20),
          Text(
            location.dimension,
            style: rickTextStyle24,
          ),
          const SizedBox(height: 40),
          Text(
            "Type",
            style: rickTextStyle24.copyWith(color: colorYellow),
          ),
          const SizedBox(height: 20),
          Text(
            location.type,
            style: rickTextStyle24,
          )
        ],
      ),
    );
  }
}
