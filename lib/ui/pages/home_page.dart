import 'package:flutter/material.dart';
import 'package:layanan/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text('Rollo Store'),
      ),
      body: Container(),
    );
  }
}
