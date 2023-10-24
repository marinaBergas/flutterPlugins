import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your places'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Consumer<GreatPlaces>(
                  child: const Center(
                      child: Text('Got not places yes,starting adding some !')),
                  builder: (context, greatPlaces, ch) => Container(
                    child: greatPlaces.items.isEmpty
                        ? ch
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (context, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[i].image),
                              ),
                              title: Text(greatPlaces.items[i].title),
                              onTap: () {
                                //go to details
                              },
                            ),
                          ),
                  ),
                ),
        ));
  }
}
