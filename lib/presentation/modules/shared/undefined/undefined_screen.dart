import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UndefinedScreen extends StatelessWidget {
  const UndefinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Undefined Route')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('No route defined for this screen.'),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Go Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
