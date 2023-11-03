import 'package:flutter/material.dart';

import '../../../components/buttons.dart';
import '../../../components/constants.dart';
import 'login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHeightInitialized = false;
  bool _isContainerExpanded = false;
  late double _heightLogo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isHeightInitialized) {
      _heightLogo = MediaQuery.of(context).size.height * 0.70;
      _isHeightInitialized = true;
    }
  }

  void _expandContainer() {
    setState(() {
      _isContainerExpanded = !_isContainerExpanded;
      _heightLogo = _isContainerExpanded
          ? MediaQuery.of(context).size.height * 0.25
          : MediaQuery.of(context).size.height * 0.70;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //Logo
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _heightLogo,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            child: GestureDetector(
              onTap: _isContainerExpanded ? _expandContainer : null,
              child: const Image(
                image: AssetImage('assets/images/logo.gif'),
              ),
            ),
          ),
        ),

        //Login Container
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              color: backgroundContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
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
                  _isContainerExpanded
                      ? const LoginForm()
                      : PrimaryButton(
                          onPressed: _expandContainer,
                          child: const Text('ACESSAR'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
