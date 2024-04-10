import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String _loginError = "";

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // signing in
  Future signIn() async {
    try {} catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          setState(() {
            _loginError =
                "User with ${_idController.text} doesn't exist. Please sign up instead.";
          });
        } else if (error.code == "wrong-password") {
          setState(() {
            _loginError = "You have entered wrong password, Please try again!";
          });
        } else if (error.code == 'network-request-failed') {
          setState(() {
            _loginError =
                "You have lost connection. \n Please check your internet connection.";
          });
          print('An error occurred: ${error.message}');
        }
      } else {
        print("error from sign up: $error");
      }
    }
  }

  // handle form submitting
  void handleFormSubmitting() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      signIn();
    }
  }

  // validate password
  String? validatePassword(value) {
    if (value.isEmpty) {
      return "Enter your Password,Please!";
    } else if (value.length < 6) {
      return "Password length should be at least 6";
    } else {
      return null;
    }
  }

  // validate id

  String? validateId(value) {
    if (value.isEmpty) {
      return "Enter You Id Please";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      _loginError,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputField(
                        validator: validateId,
                        onSaved: (value) {
                          _idController.text = value!;
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
                        validator: validatePassword,
                        onSaved: (value) {
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
                  onTap: () => handleFormSubmitting(),
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
                            decorationColor: Color.fromARGB(255, 87, 172, 246),
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
    );
  }
}
