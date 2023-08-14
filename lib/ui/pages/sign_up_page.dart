import 'package:flutter/material.dart';
import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/widgets/buttons.dart';
import 'package:layanan/ui/widgets/forms.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 40,
              bottom: 40,
            ),
          ),
          Text(
            'Silahkan \n SignUp',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Note nama
                const CustomFormField(
                  title: 'Nama',
                ),
                const SizedBox(
                  height: 16,
                ),
                //Note email
                const CustomFormField(
                  title: 'Email',
                ),
                const SizedBox(
                  height: 16,
                ),
                //Note username
                const CustomFormField(
                  title: 'Username',
                ),

                const SizedBox(
                  height: 16,
                ),
                //Note password
                const CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 16,
                ),
                //Note password
                const CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 8,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: blueTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Register',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextButton(
            title: 'Sign In',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
          )
        ],
      ),
    );
  }
}
