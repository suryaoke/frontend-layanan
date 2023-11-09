import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:layanan/shared/shared_values.dart';
import 'package:layanan/ui/widgets/buttons.dart'; // Ubah dengan lokasi yang sesuai dengan struktur proyek Anda

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _forgotPassword() async {
    String email = _emailController.text;
    var url = Uri.parse('$baseUrl/forgotpassword');
    var response = await http.post(url, body: {'email': email});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // Handle the success response here
      print(data['message']);
      // Navigates to the '/sign-in' route and removes all the previous routes
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/sign-in',
        (route) => false,
      );
    } else {
      var error = json.decode(response.body);
      // Handle the error response here
      print(error['error']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 155,
              height: 150,
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 100,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_mankotapadang.png'),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 40),
            CustomFilledButton(
              title: 'Send Email',
              onPressed: _forgotPassword,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
