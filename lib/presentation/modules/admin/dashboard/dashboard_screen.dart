import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Text(
          'Welcome to the Dashboard!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
