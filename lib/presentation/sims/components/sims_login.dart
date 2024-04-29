import 'dart:convert';

import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/presentation/sims/api/sims_auth.dart';
import 'package:bit_connect/presentation/sims/components/loader.dart';
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

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  // states
  bool _isLoading = true;
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

  Widget header() {
    return const Padding(
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
    );
  }

  Widget line(double width) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      color: Colors.black12,
      height: 2.0,
      width: width,
    );
  }

  Widget form(SIMSProvider simsProvider) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
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
            line(getWidth(context) * 2 / 3 - 40),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorAssets.bduColor),
                ),
                onPressed: () => submitForm(context, simsProvider),
                child: Container(
                  alignment: Alignment.center,
                  width: getWidth(context) * 2 / 3 - 50,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  line(85.0),
                  const Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  line(85.0),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => print('Open on bit'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: Container(
                alignment: Alignment.center,
                width: getWidth(context) * 2 / 3 - 50,
                child: const Text(
                  'Open BiT SIMS',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget error() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          _error,
          style: const TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget showSIMSLogin(context) {
    final simsProvider = Provider.of<SIMSProvider>(context, listen: false);

    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        width: getWidth(context),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                Stack(
                  children: [
                    if (_isLoading) loader(),
                    if (_error.isNotEmpty && !_isLoading) error(),
                    if (!_isLoading && _error.isEmpty) form(simsProvider),
                  ],
                ),
                if (_error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TextButton(
                      onPressed: () => setState(() {
                        _error = "";
                      }),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              size: 18,
                            ),
                            Text(
                              'try again',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.only(right: 8),
                  child: TextButton(
                    onPressed: () {
                      simsProvider.cancelLogin();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
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
