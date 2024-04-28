import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SIMSLogin extends StatelessWidget {
  static final _usernameController = TextEditingController();
  static final _passwordController = TextEditingController();

  const SIMSLogin({super.key});

  static String? usernameValidator(String? username) {
    return null;
  }

  static String? passwordValidator(String? password) {
    return null;
  }

  static Future<void> showSIMSLogin(context) async {
    final simsProvider = Provider.of<SIMSProvider>(context, listen: false);
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
                    onPressed: () => {},
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

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
