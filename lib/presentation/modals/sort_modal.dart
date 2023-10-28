import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/presentation/providers/providers.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class SortLocationsModal extends StatelessWidget {
  const SortLocationsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        constraints: const BoxConstraints(maxHeight: 300),
        child: const Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SortBody(),
            ]),
          ),
        ),
      ),
    );
  }
}

class SortBody extends StatelessWidget {
  const SortBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locationsProvider = Provider.of<LocationsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sort By:",
          style: rickTextStyle45,
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const Text(
            'Name asc:',
            style: rickTextStyle24,
          ),
          leading: Radio<String>(
            value: "asc",
            groupValue: locationsProvider.sortmode,
            onChanged: (String? value) {
              locationsProvider.sortmode = value!;
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Name Desc',
            style: rickTextStyle24,
          ),
          leading: Radio<String>(
            value: "dsc",
            groupValue: locationsProvider.sortmode,
            onChanged: (String? value) {
              locationsProvider.sortmode = value!;
            },
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: ButtonPrimary(
            textButton: "Sort",
            width: 120,
            onpressParam: () async {
              final locationsProvider =
                  Provider.of<LocationsProvider>(context, listen: false);
              locationsProvider.sortLocationsByName();
              context.pop();
            },
          ),
        )
      ],
    );
  }
}
