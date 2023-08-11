import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Container(
          width: 155,
          height: 150,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/img_mankotapadang.png',
            ),
          )),
        ),
      ),
    );
  }
}
