import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorites_provider.dart';
import '../provider/weather_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favProv = context.watch<FavoritesProvider>();
    final weatherProv = context.read<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Cities")),
      body: ListView.builder(
        itemCount: favProv.favoriteCities.length,
        itemBuilder: (_, i) {
          final city = favProv.favoriteCities[i];
          return ListTile(
            title: Text(city),
            onTap: () async {
              await weatherProv.fetchWeather(context, city);
              Navigator.pushNamed(context, "/details");
            },
          );
        },
      ),
    );
  }
}
