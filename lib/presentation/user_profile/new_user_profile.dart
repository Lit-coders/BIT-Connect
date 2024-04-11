import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({super.key});

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  final _currentUser = FirebaseAuth.instance.currentUser;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _deptController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text(
          "Build Your Profile",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              print("skip!");
            },
            style: const ButtonStyle(
              side: MaterialStatePropertyAll(
                BorderSide(
                  color: Colors.blue,
                ),
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            child: const Text("skip"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Container(
                width: getWidth(context) * 1 / 3,
                height: getWidth(context) * 1 / 3,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage("assets/icons/person.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputField(
                          validator: (value) {
                            return null;
                          },
                          controller: _firstNameController,
                          width: getWidth(context),
                          hintText: "First Name",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: (value) {},
                        ),
                        InputField(
                          validator: (value) {
                            return null;
                          },
                          controller: _lastNameController,
                          width: getWidth(context),
                          hintText: "Last Name",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: (value) {},
                        ),
                        InputField(
                          validator: (value) {
                            return null;
                          },
                          controller: _deptController,
                          width: getWidth(context),
                          hintText: "Department",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: (value) {},
                        ),
                        InputField(
                          validator: (value) {
                            return null;
                          },
                          controller: _yearController,
                          width: getWidth(context),
                          hintText: "Year",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("current user: $_currentUser");
                  // FirebaseAuth.instance.signOut();
                },
                child: const Text(
                  "Sign Out",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
