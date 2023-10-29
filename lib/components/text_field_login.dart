import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: primaryColor,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryColor),
        ),
        prefixIcon: Icon(Icons.person_outlined),
        labelText: 'Login',
      ),
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({super.key});

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryColor),
        ),
        prefixIcon: const Icon(Icons.lock_outlined),
        labelText: 'Senha',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon:
              Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
