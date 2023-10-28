import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/helpers/helpers.dart';
import 'package:rick_morty_doubelv/presentation/providers/characters_provider.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final charactersPorvider = Provider.of<CharactersProvider>(context);

    final character = charactersPorvider.character;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name,
          style: rickTextStyle24,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarCharacter(character: character),
            const SizedBox(height: 25),
            Text("Aditional Information",
                style: rickTextStyle24.copyWith(color: colorGreen)),
            const SizedBox(height: 25),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InfoCharacter(character: character)),
            Expanded(
                child: ListEpisodes(
              episodes: character.episode,
            ))
          ],
        ),
      ),
    );
  }
}

class InfoCharacter extends StatelessWidget {
  const InfoCharacter({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final idLocation = getIdUrl(character.origin.url);
    var divider = const Divider(
      color: colorGreen,
    );
    return Column(
      children: [
        _CategoryCharacter(
          title: "Species:",
          value: character.species,
        ),
        divider,
        _CategoryCharacter(
          title: "Gender:",
          value: character.gender,
        ),
        divider,
        _CategoryCharacter(
          title: "Origin:",
          value: character.origin.name,
          action: idLocation == null ? null : GoToLocation(id: idLocation),
        ),
        divider,
      ],
    );
  }
}

class _CategoryCharacter extends StatelessWidget {
  final String title;
  final String value;
  final Widget? action;
  const _CategoryCharacter({
    required this.title,
    required this.value,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title, style: rickTextStyle20.copyWith(color: colorBlue)),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            value,
            style: rickTextStyle24,
          ),
        ),
        if (action != null) action!
      ],
    );
  }
}
