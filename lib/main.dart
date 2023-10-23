import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/places_list_screen.dart';
import './providers/great_places.dart';
import './screens/add_place_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          hintColor: Colors.amber,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        ),
        home: const PlaceListScreen(),
        routes: {AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen()},
      ),
    );
  }
}
