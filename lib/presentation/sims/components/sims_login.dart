import 'package:bit_connect/presentation/auth/components/input_field.dart';
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

  static String? usernameValidator(String? username) {
    if (username!.isEmpty) {
      return 'username is required!';
    } else if (!isUsernameValid(username)) {
      return 'username is not valid, please try again!';
    }
    return null;
  }

  static bool isUsernameValid(String username) {
    final RegExp pattern = RegExp(r'^BDU\d+$');
    if (username.contains(pattern)) {
      return true;
    }
    return false;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Password is required!';
    }
    return null;
  }

  static void submitForm() {
    if (_form.currentState!.validate()) {}
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
                    onPressed: () => submitForm(),
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
