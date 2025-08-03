import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/presentation/widgets/buttons/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../strings_manager.dart';

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(builder: (context) => UndefinedScreen());
}

class UndefinedScreen extends StatefulWidget {
  const UndefinedScreen({super.key});

  @override
  State<UndefinedScreen> createState() => _UndefinedScreenState();
}

class _UndefinedScreenState extends State<UndefinedScreen> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    FirebaseFirestore.instance
        .collection(AppConfig.instance.flavor.name)
        .doc(AppConfig.instance.platform.name)
        .set({'time': _counter})
        .then((value) {
          print('Counter updated: $_counter');
        })
        .catchError((error) {
          print('Failed to update counter: $error');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppStrings.noRoute.tr()),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: AppButton(
                text: AppStrings.login.tr(),
                onPressed: () => _incrementCounter(),
                //todo
                // onPressed: () =>
                //     context.pushNamedAndRemoveUntil(Routes.loginRoute.path),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
