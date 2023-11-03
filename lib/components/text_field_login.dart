import 'package:flutter/material.dart';

class TextFormFieldLogin extends StatefulWidget {
  TextFormFieldLogin({super.key, required this.emailController});

  TextEditingController emailController;

  @override
  State<TextFormFieldLogin> createState() => _TextFormFieldLoginState();
}

class _TextFormFieldLoginState extends State<TextFormFieldLogin> {
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
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
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

class TextFormFieldPassword extends StatefulWidget {
  TextFormFieldPassword(
      {super.key,
      required this.passwordController,
      required this.functionSubmit});
  TextEditingController passwordController;
  Function functionSubmit;

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
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
      onFieldSubmitted: (value) => widget.functionSubmit(),
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
                ? const Icon(Icons.visibility_outlined)
                : const Icon(Icons.visibility_off_outlined)),
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
