import 'package:bit_connect/presentation/login/components/input_field.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(context) * 1 / 3,
                  child: const Image(
                    image: AssetImage(
                      "assets/logo.png",
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InputField(
                              width: getWidth(context) * 5 / 6 - 45,
                              hintText: 'Scan Your ID',
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
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
                            )
                          ],
                        ),
                      ),
                      InputField(
                        width: getWidth(context),
                        hintText: 'Enter Password',
                      ),
                      InputField(
                        width: getWidth(context),
                        hintText: 'Confirm Password',
                      ),
                    ],
                  ),
                ),
                Container(
                  width: getWidth(context),
                  color: Colors.blue,
                  child: GestureDetector(
                    onTap: () {
                      print("attempt  to sign up");
                    },
                    child: const Text(
                      'Sign Up',
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text("already have an account?"),
                      TextButton(
                        onPressed: () {
                          print("toggle to login");
                        },
                        child: const Text(
                          "Login",
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
    );
  }
}
