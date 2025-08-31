import 'package:acacia/generated/assets.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/form_header.dart';
import 'package:acacia/presentation/ui/widgets/text_form_field.dart';
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
                    AppTextFormField(svgPrefixPath: Assets.iconsSms),
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
