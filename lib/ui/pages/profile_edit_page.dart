import 'package:flutter/material.dart';
import 'package:layanan/blocs/auth/auth_bloc.dart';
import 'package:layanan/models/user_edit_model.dart';
import 'package:layanan/shared/shared_methods.dart';
import 'package:layanan/shared/theme.dart';
import 'package:layanan/ui/widgets/buttons.dart';
import 'package:layanan/ui/widgets/forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      namaController.text = authState.user.name ?? '';
      emailController.text = authState.user.email ?? '';
      usernameController.text = authState.user.username ?? '';
      passwordController.text = authState.user.password ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authfailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
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
                    CustomFormField(
                      title: 'Nama',
                      controller: namaController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //Note email
                    CustomFormField(
                      title: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //Note username
                    CustomFormField(
                      title: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //Note password
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Save',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdateUser(
                                UserEditFormModel(
                                  username: usernameController.text,
                                  name: namaController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
