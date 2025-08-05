import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Login Screen!'),
            ElevatedButton(
              onPressed: () {
                AppConfig.instance.currentRole.value = UserRole.admin;
                context.pushNamed(Routes.dashboard.name);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
