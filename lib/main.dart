import 'package:flutter/material.dart';
import 'package:layanan/blocs/auth/auth_bloc.dart';
import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/pages/home_page.dart';
import 'package:layanan/ui/pages/onboarding_page.dart';
import 'package:layanan/ui/pages/sign_in_page.dart';
import 'package:layanan/ui/pages/sign_up_page.dart';
import 'package:layanan/ui/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}