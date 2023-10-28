import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/helpers/helpers.dart';
import 'package:rick_morty_doubelv/locations/domain/entities/location_model.dart';
import 'package:rick_morty_doubelv/presentation/modals/modals.dart';
import 'package:rick_morty_doubelv/presentation/providers/locations_provider.dart';
import 'package:rick_morty_doubelv/presentation/widgets/widgets.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationsPorvider = Provider.of<LocationsProvider>(context);
    final locations = locationsPorvider.locations;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Locations",
          style: rickTextStyle45,
        ),
        actions: [
          IconButton(
              onPressed: () {
                fadeInRigthTransition(context, const SortLocationsModal(),
                    barrierDismissible: true);
              },
              icon: const Icon(
                Icons.sort_by_alpha,
                size: 40,
              )),
        ],
      ),
      body: locations.isEmpty && !locationsPorvider.loading
          ? const NotFound()
          : _BodyLocations(
              locationsPorvider: locationsPorvider, locations: locations),
    );
  }
}

class _BodyLocations extends StatelessWidget {
  const _BodyLocations({
    required this.locationsPorvider,
    required this.locations,
  });

  final LocationsProvider locationsPorvider;
  final List<LocationModel> locations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: locationsPorvider.loading
            ? const Center(child: CustomLoading())
            : ListLocations(
                locations: locations,
                nextPage: () {
                  locationsPorvider.getAllLocations();
                },
              ),
      ),
    );
  }
}

class ListLocations extends StatefulWidget {
  final Function nextPage;
  const ListLocations({
    super.key,
    required this.locations,
    required this.nextPage,
  });

  final List<LocationModel> locations;

  @override
  State<ListLocations> createState() => _ListLocationsState();
}

class _ListLocationsState extends State<ListLocations> {
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
      itemCount: widget.locations.length,
      itemBuilder: (BuildContext context, int index) {
        final location = widget.locations[index];
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
                    location.name,
                    style: rickTextStyle24,
                  ),
                ),
                GoToLocation(id: location.id)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Type:",
                  style: rickTextStyle20.copyWith(color: colorBlue),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    location.type,
                    style: rickTextStyle24,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
