import 'dart:io';

import 'package:bit_connect/presentation/auth/components/error_snack_bar.dart';
import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/presentation/user_profile/abc.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({super.key});

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _currentUser = FirebaseAuth.instance.currentUser;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _deptController = TextEditingController();
  final _yearController = TextEditingController();

  File? _ppPath;
  String? firstName;
  String? lastName;
  String? dept;
  int? year;

  final _imgPicker = ImagePicker();

  @override
  void dispose() {
    _firstNameController.dispose();

    super.dispose();
  }

  // updated data sender function : to database
  Future<void> updateProfile(
      {ppPath,
      required fName,
      required lName,
      required dept,
      required year}) async {
    print("new User: fName: $fName, lName: $lName, dept: $dept, year: $year");
  }

  // handle picking an image with image_picker package
  Future<void> pickImage() async {
    try {
      final pickedFile =
          await _imgPicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _ppPath = File(pickedFile.path);
        });
      }
    } catch (error) {
      final snackBar =
          ErrorSnackBar(content: "Unable to pick image, please try again!");
      ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
    }
  }

  Widget iconButton() {
    return IconButton(
      onPressed: () => pickImage(),
      icon: Icon(
        Icons.add_photo_alternate,
        color: Colors.blue[400],
        size: 30,
      ),
    );
  }

  Widget selectedImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Image.file(
        _ppPath!.absolute,
        fit: BoxFit.cover,
        width: getWidth(context) * 1 / 3 + 20,
        height: getWidth(context) * 1 / 3 + 20,
      ),
    );
  }

  Widget imgBtn() {
    return ElevatedButton(
      onPressed: () => pickImage(),
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color.fromARGB(56, 232, 241, 247),
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 10),
          ),
          shadowColor: MaterialStatePropertyAll(Colors.transparent)),
      child: Text(
        _ppPath == null ? 'Upload Profile Picture' : 'Change Profile Picture',
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }

  // validators
  String? validateFName(value) {
    if (value.isEmpty) {
      return "Please enter your first name";
    } else {
      return null;
    }
  }

  String? validateLName(value) {
    if (value.isEmpty) {
      return "Please enter your last name";
    } else {
      return null;
    }
  }

  String? validateDet(value) {
    if (value.isEmpty) {
      return "Please enter your dept";
    } else {
      return null;
    }
  }

  String? validateYear(value) {
    if (value.isEmpty) {
      return "Please enter your years in campus!";
    } else {
      return null;
    }
  }

  void checkYear(value) {
    final pattern = RegExp(r'[0-9]{1}');
    if (pattern.hasMatch(value)) {
      setState(() {
        _yearController.text = value[0];
      });
    } else {
      _yearController.clear();
    }
  }

  void finishUpdatingProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      updateProfile(
        fName: _firstNameController.text,
        lName: _lastNameController.text,
        dept: _deptController.text,
        year: _yearController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(getWidth(context), 70),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Abc(),
                  ),
                );
              },
              style: const ButtonStyle(
                side: MaterialStatePropertyAll(
                  BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              child: const Text(
                "skip",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: getWidth(context) * 1 / 3 + 20,
                height: getWidth(context) * 1 / 3 + 20,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(200, 33, 149, 243),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Center(
                  child: _ppPath == null ? iconButton() : selectedImage(),
                ),
              ),
              imgBtn(),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputField(
                          validator: validateFName,
                          controller: _firstNameController,
                          width: getWidth(context),
                          hintText: "First Name",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: (value) {},
                        ),
                        InputField(
                          validator: validateLName,
                          controller: _lastNameController,
                          width: getWidth(context),
                          hintText: "Last Name",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: (value) {},
                        ),
                        InputField(
                          validator: validateDet,
                          controller: _deptController,
                          width: getWidth(context),
                          hintText: "Department",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: (value) {},
                        ),
                        InputField(
                          validator: validateYear,
                          controller: _yearController,
                          width: getWidth(context),
                          hintText: "Year",
                          isReadOnly: false,
                          hasObscure: false,
                          onChange: checkYear,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => finishUpdatingProfile(),
                child: Container(
                  width: getWidth(context) * 2 / 3,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(100, 110, 182, 255),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Finish',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
