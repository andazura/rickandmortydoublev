import 'package:flutter/material.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/helpers/helpers.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class ListEpisodes extends StatelessWidget {
  final List<String> episodes;
  const ListEpisodes({super.key, required this.episodes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Episodes",
          style: rickTextStyle24.copyWith(color: colorGreen),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: episodes.length,
            itemBuilder: (BuildContext context, int index) {
              final episode = episodes[index];

              final id = getIdUrl(episode);
              return ListTile(
                title: Text(
                  "Episode : $id",
                  style: rickTextStyle24,
                ),
                trailing: GoToEpisode(id: id!),
              );
            },
          ),
        ),
      ],
    );
  }
}
