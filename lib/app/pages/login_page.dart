import 'package:docpost/app/data/repositories/auth_repository.dart';
import 'package:docpost/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../components/buttons.dart';
import '../../components/text_field_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _heightContainer = 250;
  bool _containerIsExpanded = false;

  void _expandContainer() {
    setState(() {
      _heightContainer = _containerIsExpanded
          ? 250
          : MediaQuery.of(context).size.height * 0.70;
      _containerIsExpanded = !_containerIsExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Logo
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: GestureDetector(
                onTap: _containerIsExpanded ? _expandContainer : null,
                child: const Image(
                  image: AssetImage('assets/images/logo.gif'),
                ),
              ),
            ),
          ),

          //Container login
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: MediaQuery.of(context).size.width,
            height: _heightContainer,
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              color: backgroundContainer,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Gerencie seus pagamentos com facilidade e segurança.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Faça login para começar',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 14),
                  _containerIsExpanded
                      ? const LoginForm()
                      : PrimaryButtonNew(
                          onPressed: _expandContainer,
                          child: const Text('ACESSAR'),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var loadingLogin = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFieldLogin(
            emailController: _emailController,
          ),
          const SizedBox(height: 14),
          TextFormPassword(
            passwordController: _passwordController,
          ),
          const SizedBox(height: 28),
          PrimaryButtonNew(
            child: loadingLogin
                ? LoadingAnimationWidget.waveDots(color: Colors.white, size: 40)
                : const Text('ENTRAR'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  loadingLogin = !loadingLogin;
                });
                await AuthRepository(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .authentication();
                setState(() {
                  loadingLogin = !loadingLogin;
                });
              }
            },
          ),
          const SizedBox(height: 6),
          SecondaryButton(
            label: 'ESQUECI A SENHA',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
