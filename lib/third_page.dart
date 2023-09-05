import 'package:flutter/material.dart';
import 'package:fp_test/utils/commons.dart';

class ThirdPage extends StatelessWidget {
  final Map data;
  const ThirdPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pageWidget(data)),
    );
  }
}
