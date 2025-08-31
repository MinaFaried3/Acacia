import 'package:acacia/presentation/modules/admin/login/layout/desktop_admin_login.dart';
import 'package:acacia/presentation/modules/admin/login/layout/mobile_admin_login.dart';
import 'package:acacia/presentation/ui/responsive/adaptive_layout.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      desktopLayout: (context) => DesktopAdminLogin(),
      mobileLayout: (context) => MobileAdminLogin(),
    );
  }
}
