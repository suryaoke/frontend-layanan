import 'package:flutter/material.dart';
import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/widgets/buttons.dart';
import 'package:layanan/ui/widgets/forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
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

                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Save',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
