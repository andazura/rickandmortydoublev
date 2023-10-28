import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/helpers/helpers.dart';
import 'package:rick_morty_doubelv/presentation/providers/providers.dart';

class ListCharacters extends StatelessWidget {
  final List<String> characters;
  const ListCharacters({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Characters",
          style: rickTextStyle24.copyWith(color: colorGreen),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (BuildContext context, int index) {
              final character = characters[index];

              final id = getIdUrl(character);
              return ListTile(
                title: Text(
                  "Character : $id",
                  style: rickTextStyle24,
                ),
                trailing: IconButton.outlined(
                    color: colorGreen,
                    highlightColor: colorGreen,
                    splashColor: colorGreen,
                    onPressed: () async {
                      final charactersPorvider =
                          Provider.of<CharactersProvider>(context,
                              listen: false);
                      await charactersPorvider.getCharacter(id!);
                      context.push("/character");
                    },
                    icon: const Icon(
                      Icons.remove_red_eye_sharp,
                      color: colorGreen,
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
