import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    printer('ProductsScreen build called', color: ConsoleColor.green);
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Center(
        child: Column(
          children: [
            Text(
              'Welcome to the Products Screen!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () => context.pushNamed(Routes.productDetails.name),
              child: Text('Go to Product Details'),
            ),
          ],
        ),
      ),
    );
  }
}
