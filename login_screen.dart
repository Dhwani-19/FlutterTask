import 'dart:convert';

import 'package:demo_app/ApiClient.dart';
import 'package:demo_app/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/login_resp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  testfun() {
    setState(() {
      var res = ApiClient().loginUser(email: mailController.text,password: passwordController.text);
      if (res != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: mailController,
                decoration: const InputDecoration(hintText: 'Enter Email'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Enter Password'),
              ),
            ),
            ElevatedButton(onPressed: testfun, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
