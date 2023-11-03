import 'package:docpost/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../components/buttons.dart';
import '../../../components/snackbar.dart';
import '../../../components/text_field_login.dart';
import '../../../components/constants.dart';
import '../../repositories/auth_repository.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _loadingLogin = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authController = AuthController();

  Future _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loadingLogin = !_loadingLogin;
      });

      bool success = await authController.login(
          _emailController.text, _passwordController.text);

      setState(() {
        _loadingLogin = !_loadingLogin;
      });

      if (success) {
        Get.offAndToNamed('/home');
      } else {
        snackbarErro('Falha na autenticação');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormFieldLogin(
            emailController: _emailController,
          ),
          const SizedBox(height: 14),
          TextFormFieldPassword(
            passwordController: _passwordController,
            functionSubmit: _handleLogin,
          ),
          const SizedBox(height: 28),
          PrimaryButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              _handleLogin();
            },
            child: _loadingLogin
                ? LoadingAnimationWidget.waveDots(
                    color: foregroundPrimaryButtonColor,
                    size: 40,
                  )
                : const Text('ENTRAR'),
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
