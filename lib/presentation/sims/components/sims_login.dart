import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/presentation/sims/helpers/sims_helpers.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SIMSLogin extends StatelessWidget {
  static final _usernameController = TextEditingController();
  static final _passwordController = TextEditingController();
  static final GlobalKey<FormState> _form = GlobalKey();

  const SIMSLogin({super.key});

  static void submitForm(context) {
    final simsProvider = Provider.of<SIMSProvider>(context, listen: false);

    if (_form.currentState!.validate()) {
      if (simsProvider.isUserLoggedInBefore) {
        // pass login process
      } else {
        simsProvider.login(_usernameController.text, _passwordController.text);
      }
    }
  }

  static Future<void> showSIMSLogin(context) async {
    final simsProvider = Provider.of<SIMSProvider>(context, listen: false);
    await initializeLoginPreference(simsProvider);
    if (simsProvider.isUserLoggedInBefore) {
      return;
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SizedBox(
            width: getWidth(context),
            height: getHeight(context) * 1 / 2,
            child: AlertDialog(
              contentPadding: const EdgeInsets.only(top: 20),
              scrollable: true,
              title: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.login,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Login',
                  ),
                  Expanded(
                    child: Text(
                      'BiT SIMS',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              content: Form(
                key: _form,
                child: Column(
                  children: [
                    InputField(
                      validator: usernameValidator,
                      controller: _usernameController,
                      width: getWidth(context) * 2 / 3,
                      hintText: 'username',
                      isReadOnly: false,
                      hasObscure: false,
                      onChange: (value) {},
                    ),
                    InputField(
                      validator: passwordValidator,
                      controller: _passwordController,
                      width: getWidth(context) * 2 / 3,
                      hintText: 'Password',
                      isReadOnly: false,
                      hasObscure: true,
                      onChange: (value) {},
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorAssets.bduColor),
                      ),
                      onPressed: () => submitForm(context),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    simsProvider.cancelLogin();
                    Navigator.pop(context);
                  },
                  child: const Text('cancel'),
                )
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
