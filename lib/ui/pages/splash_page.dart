import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layanan/shared/theme.dart';

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
      Navigator.pushNamedAndRemoveUntil(
          context, '/onboarding', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Container(
          width: 195,
          height: 190,
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:layanan/blocs/auth/auth_bloc.dart';
// import 'package:layanan/shared/theme.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: darkBackgroundColor,
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSuccess) {
//             Navigator.pushNamedAndRemoveUntil(
//                 context, '/home', (route) => false);
//           }
//           if (state is Authfailed) {
//             Navigator.pushNamedAndRemoveUntil(
//                 context, '/onboarding', (route) => false);
//           }
//         },
//         child: Center(
//           child: Container(
//             width: 195,
//             height: 190,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//               image: AssetImage(
//                 'assets/img_mankotapadang.png',
//               ),
//             )),
//           ),
//         ),
//       ),
//     );
//   }
// }
