import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/presentation/providers/providers.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class FilterCharacterModal extends StatelessWidget {
  const FilterCharacterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        constraints: const BoxConstraints(maxHeight: 360),
        child: const Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              FilterByState(),
            ]),
          ),
        ),
      ),
    );
  }
}

class FilterByState extends StatelessWidget {
  const FilterByState({super.key});

  @override
  Widget build(BuildContext context) {
    final fliterProvider = Provider.of<FilterProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "State",
          style: rickTextStyle45,
        ),
        ListTile(
          title: const Text(
            'alive',
            style: rickTextStyle24,
          ),
          leading: Radio<String>(
            value: "alive",
            groupValue: fliterProvider.filterState,
            onChanged: (String? value) {
              fliterProvider.filterState = value!;
            },
          ),
        ),
        ListTile(
          title: const Text(
            'dead',
            style: rickTextStyle24,
          ),
          leading: Radio<String>(
            value: "dead",
            groupValue: fliterProvider.filterState,
            onChanged: (String? value) {
              fliterProvider.filterState = value!;
            },
          ),
        ),
        ListTile(
          title: const Text(
            'unknown',
            style: rickTextStyle24,
          ),
          leading: Radio<String>(
            value: "unknown",
            groupValue: fliterProvider.filterState,
            onChanged: (String? value) {
              fliterProvider.filterState = value!;
            },
          ),
        ),
        ListTile(
          title: const Text(
            'all',
            style: rickTextStyle24,
          ),
          leading: Radio<String>(
            value: "all",
            groupValue: fliterProvider.filterState,
            onChanged: (String? value) {
              fliterProvider.filterState = value!;
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: ButtonPrimary(
            textButton: "Filtrar",
            width: 120,
            onpressParam: () async {
              final charactersPorvider =
                  Provider.of<CharactersProvider>(context, listen: false);
              if (fliterProvider.filterState == "all") {
                charactersPorvider.queryFecth = {};
                charactersPorvider.page = 1;

                await charactersPorvider.getAllCharacters(page: 1);
              } else {
                charactersPorvider.queryFecth = {
                  "status": fliterProvider.filterState
                };
                await charactersPorvider.filterCharacters();
              }
              context.pop();
            },
          ),
        )
      ],
    );
  }
}
