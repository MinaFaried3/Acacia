import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:flutter/material.dart';

class PriceListsScreen extends StatelessWidget {
  const PriceListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    printer('PriceListsScreen build called', color: ConsoleColor.green);
    return Scaffold(
      appBar: AppBar(title: const Text('Price List')),
      body: Center(
        child: Text(
          'Price List will be displayed here.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
