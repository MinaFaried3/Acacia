import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:flutter/material.dart';

class OilsScreen extends StatelessWidget {
  const OilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    printer('OilsScreen build called', color: ConsoleColor.green);
    return Scaffold(
      appBar: AppBar(title: const Text('Oil Management')),
      body: Center(
        child: Text(
          'Welcome to the Oil Management Screen!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
