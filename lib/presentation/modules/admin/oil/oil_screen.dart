import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OilsScreen extends StatelessWidget {
  const OilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    printer('OilsScreen build called', color: ConsoleColor.green);
    return Scaffold(
      appBar: AppBar(title: const Text('Oil Management')),
      body: Center(
        child: Column(
          children: [
            Text(
              'Welcome to the Oil Management Screen!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () => context.pushNamed(Routes.priceList.name),
              child: Text(
                'Go to Price List',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
