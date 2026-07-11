import 'package:flutter/material.dart';

class PlaceholderHomeScreen extends StatelessWidget {
  const PlaceholderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Kazi',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
