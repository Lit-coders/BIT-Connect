import 'package:bit_connect/presentation/login/components/input_field.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

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
                        Row(
                          children: [
                            InputField(
                              onChange: (value) {
                                print(value);
                              },
                              width: getWidth(context) * 5 / 6 - 45,
                              hintText: 'Scan Your ID',
                              isReadOnly: true,
                              isObscured: false,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () => print("Scannig ID ..."),
                              child: Container(
                                width: getWidth(context) * 1 / 6 - 10,
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(100, 0, 0, 0),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Image(
                                  image: AssetImage(
                                    "assets/icons/barcode.png",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        InputField(
                          onChange: (value) {
                            print(value);
                          },
                          width: getWidth(context),
                          hintText: 'Enter Password',
                          isReadOnly: false,
                          isObscured: true,
                        ),
                        InputField(
                          onChange: (value) {
                            print(value);
                          },
                          width: getWidth(context),
                          hintText: 'Confirm Password',
                          isReadOnly: false,
                          isObscured: true,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("attempt  to sign up");
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
                          'Sign Up',
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
                          "Already have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print(
                              "toggle to login",
                            );
                          },
                          child: const Text(
                            "login",
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
