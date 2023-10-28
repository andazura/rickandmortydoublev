import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/helpers/helpers.dart';
import 'package:rick_morty_doubelv/presentation/modals/modals.dart';
import 'package:rick_morty_doubelv/presentation/providers/characters_provider.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final charactersPorvider = Provider.of<CharactersProvider>(context);
    final characters = charactersPorvider.characters;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Characters",
          style: rickTextStyle45,
        ),
      ),
      body: charactersPorvider.isloading
          ? const Center(child: CustomLoading())
          : BodyCharacters(characters: characters),
      persistentFooterButtons: [
        if (characters != null)
          _PaginationCharacter(
              characters: characters, charactersPorvider: charactersPorvider)
      ],
    );
  }
}

class BodyCharacters extends StatelessWidget {
  final CharactersResponse? characters;
  const BodyCharacters({super.key, this.characters});

  @override
  Widget build(BuildContext context) {
    return characters == null
        ? const NotFound()
        : _ListCharacters(characters: characters);
  }
}

class _ListCharacters extends StatelessWidget {
  const _ListCharacters({
    required this.characters,
  });

  final CharactersResponse? characters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        IconButton(
            onPressed: () {
              fadeInRigthTransition(context, const FilterCharacterModal(),
                  barrierDismissible: true);
            },
            icon: const Icon(
              Icons.filter_alt,
              size: 40,
            )),
        Expanded(
          child: ListView.builder(
            itemCount: characters!.results.length,
            itemBuilder: (BuildContext context, int index) {
              final character = characters!.results[index];
              return CardCharacter(
                character: character,
                index: index,
              );
            },
          ),
        ),
      ]),
    );
  }
}

class _PaginationCharacter extends StatelessWidget {
  const _PaginationCharacter({
    required this.characters,
    required this.charactersPorvider,
  });

  final CharactersResponse? characters;
  final CharactersProvider charactersPorvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${charactersPorvider.page} de ${characters!.info.pages}",
          ),
          IconButton(
              onPressed: charactersPorvider.page == 1
                  ? null
                  : () {
                      charactersPorvider.page = charactersPorvider.page - 1;
                    },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
              )),
          Text(
            "${charactersPorvider.page}",
            textAlign: TextAlign.start,
          ),
          const SizedBox(width: 5),
          IconButton(
              onPressed: charactersPorvider.page == characters!.info.pages
                  ? null
                  : () {
                      charactersPorvider.page = charactersPorvider.page + 1;
                    },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 24,
              )),
        ],
      ),
    );
  }
}

class CardCharacter extends StatelessWidget {
  final int index;
  const CardCharacter({
    super.key,
    required this.character,
    required this.index,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Card(
          elevation: 4,
          child: Row(
            children: [
              Hero(
                tag: character.id,
                child: Image.network(
                  character.image,
                  height: 200,
                  width: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/images/no-image.jpeg");
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Image.asset(
                      "assets/images/loading.gif",
                      height: 200,
                      width: 200,
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      character.name,
                      style: rickTextStyle24,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20),
                    Text(character.status,
                        style: rickTextStyle20.copyWith(
                          color: character.status.toLowerCase() != "alive"
                              ? colorRed
                              : colorGreen,
                        )),
                    const SizedBox(height: 20),
                    ButtonPrimary(
                      textButton: "Details",
                      width: 120,
                      onpressParam: () {
                        final charactersPorvider =
                            Provider.of<CharactersProvider>(context,
                                listen: false);
                        charactersPorvider.character = character;
                        context.push("/character");
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
