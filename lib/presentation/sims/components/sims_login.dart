import 'dart:convert';

import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/presentation/sims/api/sims_auth.dart';
import 'package:bit_connect/presentation/sims/helpers/sims_helpers.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:bit_connect/utils/constants/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SIMSLogin extends StatefulWidget {
  const SIMSLogin({super.key});

  @override
  State<SIMSLogin> createState() => _SIMSLoginState();
}

class _SIMSLoginState extends State<SIMSLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  String _error = "";

  void submitForm(context, simsProvider) async {
    if (_form.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        final res =
            await loginSIMS(_usernameController.text, _passwordController.text);
        final Map<String, dynamic> data = jsonDecode(res);
      } catch (error) {
        print('error from sims login file: $error');
        setState(() {
          _error = 'Something went wrong, Please try again!';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
      // simsProvider.login(_usernameController.text, _passwordController.text);
    }
  }

  Widget loader() {
    return const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget error() {
    return Center(
      child: SizedBox(
        child: Text(
          _error,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget showSIMSLogin(context) {
    final simsProvider = Provider.of<SIMSProvider>(context, listen: false);

    return Center(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        width: getWidth(context) * 3 / 4 + 300,
        height: getHeight(context) * 1 / 3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Row(
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
              ),
              Stack(
                children: [
                  if (_isLoading) loader(),
                  if (_error.isNotEmpty && !_isLoading) error(),
                  if (!_isLoading && _error.isEmpty)
                    Form(
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
                              backgroundColor: MaterialStatePropertyAll(
                                  ColorAssets.bduColor),
                            ),
                            onPressed: () => submitForm(context, simsProvider),
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
                ],
              ),
              if (_error.isNotEmpty)
                TextButton(
                  onPressed: () => setState(() {
                    _error = "";
                  }),
                  child: const Text('try again'),
                ),
              TextButton(
                onPressed: () {
                  simsProvider.cancelLogin();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final simsProvider = Provider.of<SIMSProvider>(context, listen: false);
    initializeLoginPreference(simsProvider);

    return Scaffold(
      body: Center(
        child: showSIMSLogin(context),
      ),
    );
  }
}
