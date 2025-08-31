import 'package:acacia/presentation/modules/admin/login/widgets/form_header.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/login_form.dart';
import 'package:flutter/material.dart';

class DesktopAdminLogin extends StatelessWidget {
  const DesktopAdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //welcome message
                    FormHeaderMessage(),

                    //form inputs
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Text('acacia')),
        ],
      ),
    );
  }
}
