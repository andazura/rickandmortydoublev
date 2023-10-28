import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/episodes/domain/entities/episode_model.dart';
import 'package:rick_morty_doubelv/presentation/providers/episodes_provider.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class EpisodeDetailScreen extends StatelessWidget {
  const EpisodeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final episodePorvider = Provider.of<EpisodesProvider>(context);
    final episode = episodePorvider.episode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          episode.name,
          style: rickTextStyle45,
        ),
      ),
      body: Column(children: [
        _BodyEpisode(episode: episode),
        Expanded(child: ListCharacters(characters: episode.characters))
      ]),
    );
  }
}

class _BodyEpisode extends StatelessWidget {
  final Episode episode;
  const _BodyEpisode({required this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Air date:",
            style: rickTextStyle24.copyWith(color: colorYellow),
          ),
          const SizedBox(height: 20),
          Text(
            episode.airDate,
            style: rickTextStyle24,
          ),
          const SizedBox(height: 40),
          Text(
            "Episode",
            style: rickTextStyle24.copyWith(color: colorYellow),
          ),
          const SizedBox(height: 20),
          Text(
            episode.episode,
            style: rickTextStyle24,
          )
        ],
      ),
    );
  }
}
