import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/episodes/domain/entities/episode_model.dart';
import 'package:rick_morty_doubelv/presentation/providers/episodes_provider.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class EpisodesScreen extends StatelessWidget {
  EpisodesScreen({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final episodesPorvider = Provider.of<EpisodesProvider>(context);
    final episodes = episodesPorvider.episodes;
    final episodesFilter = episodesPorvider.filterEpisodes;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Episodes",
          style: rickTextStyle45,
        ),
      ),
      body: episodes.isEmpty && !episodesPorvider.loading
          ? const NotFound()
          : _BodyEpisodes(
              episodesPorvider: episodesPorvider,
              textController: textController,
              episodes: episodes,
              episodesFilter: episodesFilter),
    );
  }
}

class _BodyEpisodes extends StatelessWidget {
  const _BodyEpisodes({
    required this.episodesPorvider,
    required this.textController,
    required this.episodes,
    required this.episodesFilter,
  });

  final EpisodesProvider episodesPorvider;
  final TextEditingController textController;
  final List<Episode> episodes;
  final List<Episode> episodesFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomInput(
                placeholder: "Find by name",
                onchage: (p0) async {
                  if (p0!.length >= 3) {
                    await episodesPorvider.getEpisodesByName(p0);
                    episodesPorvider.searchMode = true;
                  } else if (p0.isEmpty) {
                    episodesPorvider.searchMode = false;
                  }
                  return "";
                },
                textController: textController),
            const SizedBox(height: 40),
            episodesPorvider.loading
                ? const CustomLoading()
                : episodesPorvider.searchMode &&
                        !episodesPorvider.loading &&
                        episodesFilter.isEmpty
                    ? const NotFound()
                    : Expanded(
                        child: ListEpisodes(
                          episodes: episodesPorvider.searchMode
                              ? episodesFilter
                              : episodes,
                          nextPage: () {
                            episodesPorvider.getAllEpisodes();
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}

class ListEpisodes extends StatefulWidget {
  final Function nextPage;
  const ListEpisodes({
    super.key,
    required this.episodes,
    required this.nextPage,
  });

  final List<Episode> episodes;

  @override
  State<ListEpisodes> createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes> {
  final ScrollController scrollController = ScrollController();
  bool isLoad = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500)) {
        if (isLoad) return;
        isLoad = true;
        widget.nextPage();
      } else {
        isLoad = false;
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 46);
      },
      itemCount: widget.episodes.length,
      itemBuilder: (BuildContext context, int index) {
        final episode = widget.episodes[index];
        return ListItemEpisode(episode: episode);
      },
    );
  }
}

class ListItemEpisode extends StatelessWidget {
  const ListItemEpisode({
    super.key,
    required this.episode,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Name:",
              style: rickTextStyle20.copyWith(color: colorBlue),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                episode.name,
                style: rickTextStyle24,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "episode:",
              style: rickTextStyle20.copyWith(color: colorBlue),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                episode.episode,
                style: rickTextStyle24,
              ),
            ),
            GoToEpisode(id: episode.id)
          ],
        ),
      ],
    );
  }
}
