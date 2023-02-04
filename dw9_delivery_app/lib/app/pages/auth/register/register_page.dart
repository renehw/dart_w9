import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSucess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18.0),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: Validatorless.required('Nome Obrigatório *'),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('E-mail Obrigatório *'),
                        Validatorless.email('E-mail inválido'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Senha Obrigatória *'),
                        Validatorless.min(6, 'Senha deve conter pelo menos 6 caracteres'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Confirma Senha'),
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confirma Senha Obrigatório *'),
                        Validatorless.compare(_password, 'Senha diferente de confirma senha'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: DeliveryButton(
                      width: double.infinity,
                      label: 'Cadastrar',
                      onPressed: () {
                        final valid = _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(_name.text, _email.text, _password.text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
