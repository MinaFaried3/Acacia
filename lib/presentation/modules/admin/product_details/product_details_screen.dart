import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    printer('ProductDetailsScreen is build', color: ConsoleColor.green);
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Center(
        child: Text(
          'Product details will be displayed here.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
