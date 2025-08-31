import 'package:acacia/presentation/modules/admin/login/widgets/form_header.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/login_form.dart';
import 'package:acacia/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';

class MobileAdminLogin extends StatelessWidget {
  const MobileAdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //welcome message
                FormHeaderMessage(),
                VerticalSpace(60),
                //form inputs
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Login Screen')),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text('Welcome to the Login Screen!'),
    //         ElevatedButton(
    //           onPressed: () {
    //             AppConfig.instance.currentRole.value = UserRole.admin;
    //             context.goNamed(Routes.products.name);
    //           },
    //           child: const Text('Login'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
