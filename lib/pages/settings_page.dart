import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/settings_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProv = context.watch<SettingsProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Column(
        children: [
          RadioListTile(
            title: const Text("Metric (°C)"),
            value: "metric",
            groupValue: settingsProv.unit,
            onChanged: (value) {
              settingsProv.changeUnit(value!);
            },
          ),
          RadioListTile(
            title: const Text("Imperial (°F)"),
            value: "imperial",
            groupValue: settingsProv.unit,
            onChanged: (value) {
              settingsProv.changeUnit(value!);
            },
          ),
        ],
      ),
    );
  }
}
