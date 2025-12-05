import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/weather_provider.dart';
import '../provider/favorites_provider.dart';
import '../utils/format_time.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.watch<WeatherProvider>().weather;
    final favProv = context.watch<FavoritesProvider>();

    if (weather == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Details")),
        body: const Center(child: Text("No weather data")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.city),
        actions: [
          IconButton(
            onPressed: () {
              favProv.addFavorite(weather.city);
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            "https://openweathermap.org/img/wn/${weather.icon}@4x.png",
          ),
          Center(
            child: Text(
              "${weather.temp}°",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Center(child: Text(weather.description)),
          const SizedBox(height: 20),

          ListTile(
            title: const Text("Feels Like"),
            trailing: Text("${weather.feelsLike}°"),
          ),

          ListTile(
            title: const Text("Humidity"),
            trailing: Text("${weather.humidity}%"),
          ),

          ListTile(
            title: const Text("Wind Speed"),
            trailing: Text("${weather.wind} m/s"),
          ),

          ListTile(
            title: const Text("Sunrise"),
            trailing: Text(formatUnixTime(weather.sunrise, weather.timezone)),
          ),

          ListTile(
            title: const Text("Sunset"),
            trailing: Text(formatUnixTime(weather.sunset, weather.timezone)),
          ),
        ],
      ),
    );
  }
}
