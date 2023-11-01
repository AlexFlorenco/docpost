import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldLogin extends StatefulWidget {
  TextFieldLogin({super.key, required this.emailController});

  TextEditingController emailController;

  @override
  State<TextFieldLogin> createState() => _TextFieldLoginState();
}

class _TextFieldLoginState extends State<TextFieldLogin> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.emailController,
      validator: (email) {
        if (email == null ||
            email.isEmpty ||
            email.length < 5 ||
            !email.contains('@') ||
            !email.contains('.')) {
          return 'Digite um e-mail válido';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.person_outlined,
        ),
        label: Text(
          'E-mail',
          style: TextStyle(fontSize: 16),
        ),
        floatingLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
        ),
        hintText: 'Digite seu e-mail',
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class TextFormPassword extends StatefulWidget {
  TextFormPassword({super.key, required this.passwordController});
  TextEditingController passwordController;

  @override
  State<TextFormPassword> createState() => _TextFormPasswordState();
}

class _TextFormPasswordState extends State<TextFormPassword> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      validator: (password) {
        if (password == null || password.isEmpty || password.length < 5) {
          return 'Digite uma senha válida';
        }
        return null;
      },
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(
          Icons.lock_outlined,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            icon: _passwordVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        label: const Text(
          'Senha',
          style: TextStyle(fontSize: 16),
        ),
        floatingLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        hintText: 'Digite sua senha',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
