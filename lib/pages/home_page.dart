import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProv = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/favorites"),
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/settings"),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: "Search city",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () =>
                      weatherProv.fetchWeather(context, cityController.text),
                ),
              ),
            ),
            const SizedBox(height: 20),

            if (weatherProv.isLoading) const CircularProgressIndicator(),

            if (weatherProv.error != null)
              Text(
                weatherProv.error!,
                style: const TextStyle(color: Colors.red),
              ),

            if (weatherProv.weather != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/details");
                },
                child: const Text("View Weather Details"),
              ),
          ],
        ),
      ),
    );
  }
}
