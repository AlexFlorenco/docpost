import 'package:docpost/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
  bool _isExpanded = false;

  void _expandContainer() {
    setState(() {
      _heightContainer = _heightContainer == 600 ? 250 : 600;
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: GestureDetector(
                onTap: _isExpanded ? _expandContainer : null,
                child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: MediaQuery.of(context).size.width,
            height: _heightContainer,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.fromLTRB(42, 24, 42, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gerencie seus pagamentos com facilidade e segurança.',
                    style: TextStyle(height: 1.1),
                  ),
                  const SizedBox(height: 28),
                  const Text('Faça login para começar'),
                  const SizedBox(height: 6),
                  _isExpanded
                      ? const LoginForm()
                      : ExpandContainerButton(
                          closeContainer: _expandContainer,
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandContainerButton extends StatelessWidget {
  const ExpandContainerButton({super.key, required this.closeContainer});
  final VoidCallback closeContainer;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: 'ACESSAR',
      onPress: closeContainer,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldLogin(),
        const SizedBox(height: 16),
        const TextFieldPassword(),
        const SizedBox(height: 22),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: textColorWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: loadingLogin
                ? LoadingAnimationWidget.waveDots(color: Colors.white, size: 40)
                : const Text('ENTRAR'),
            onPressed: () async {
              setState(() {
                loadingLogin = !loadingLogin;
              });
              await Future.delayed(const Duration(seconds: 3));
              Get.offNamed('/home');
            },
          ),
        ),
        const SizedBox(height: 6),
        SecondaryButton(
          label: 'ESQUECI A SENHA',
          onPress: () {},
        ),
      ],
    );
  }
}
