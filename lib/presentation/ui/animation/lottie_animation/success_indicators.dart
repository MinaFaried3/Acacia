import 'package:flutter/material.dart';

class SuccessIndicator extends StatelessWidget {
  const SuccessIndicator({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
