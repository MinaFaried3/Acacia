import 'package:acacia/generated/assets.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/login_form.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/pharaohs_icons_list.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';

class DesktopAdminLogin extends StatelessWidget {
  const DesktopAdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 3, child: LoginForm()),
          Expanded(
            child: Row(
              children: [
                PharaohsIconList(),
                HorizontalSpace(10),
                Expanded(
                  child: Container(
                    color: AppColors.darkFern,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(75.0),
                        child: Image.asset(Assets.logoTypoLogoLight),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
