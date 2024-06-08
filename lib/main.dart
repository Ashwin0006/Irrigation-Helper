import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(water_sprinkler());
}

class water_sprinkler extends StatelessWidget {
  const water_sprinkler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Water Sprinkler System",
      home: PlantInfoScreen(),
    );
  }
}
