import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final VoidCallback toggleToSignUP;
  const Login({super.key, required this.toggleToSignUP});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: getHeight(context) * 1 / 3 + 60,
                    child: const Image(
                      image: AssetImage(
                        "assets/logo.png",
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputField(
                          onChange: (value) {
                            print(value);
                          },
                          controller: _idController,
                          width: getWidth(context),
                          hintText: 'Enter ID',
                          isReadOnly: false,
                          isObscured: false,
                          hasObscure: false,
                        ),
                        InputField(
                          onChange: (value) {
                            print(value);
                          },
                          controller: _passwordController,
                          width: getWidth(context),
                          hintText: 'Enter Password',
                          isReadOnly: false,
                          isObscured: true,
                          hasObscure: true,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("attempt  to login ");
                    },
                    child: Container(
                      width: getWidth(context),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 87, 172, 246),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        TextButton(
                          onPressed: widget.toggleToSignUP,
                          child: const Text(
                            "Sign UP",
                            style: TextStyle(
                              color: Color.fromARGB(255, 87, 172, 246),
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Color.fromARGB(255, 87, 172, 246),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
