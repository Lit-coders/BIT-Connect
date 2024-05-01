import 'dart:io';
import 'package:bit_connect/presentation/auth/components/error_snack_bar.dart';
import 'package:bit_connect/presentation/auth/components/input_field.dart';
import 'package:bit_connect/presentation/auth/components/loading_spinner.dart';
import 'package:bit_connect/searvices/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class BuildProfile extends StatefulWidget {
  String? email;
  String? password;
  VoidCallback? toggleToLogin;

  BuildProfile({
    super.key,
    required this.email,
    required this.password,
    required this.toggleToLogin,
  });
  BuildProfile.personIcon({super.key});

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
  String _ppUrl = "";
  bool isNetworkImage = false;
  final _imgPicker = ImagePicker();
  @override
  void initState() {
    super.initState();
    if (_currentUser != null) {
      _initUserData();
    }
  }

  Future<void> _initUserData() async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(_currentUser!.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _firstNameController.text = userDoc.get("fName");
          _lastNameController.text = userDoc.get("lLame");
          _deptController.text = userDoc.get("dept");
          _yearController.text = userDoc.get("year");
          _ppUrl = userDoc.get("ppUrl");
          if (_ppUrl != '') {
            isNetworkImage = true;
          }
        });
      }
    } catch (error) {
      print("Error fetching user data: $error");
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();

    super.dispose();
  }

  // updated data sender function : to database
  Future<String> updateProfile({
    String? ppPath,
    required fName,
    required lName,
    required dept,
    required year,
  }) async {
    LoadingSpinner.load(context);
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_currentUser!.uid)
          .set({
        'fName': fName,
        'lLame': lName,
        'year': year,
        'dept': dept,
        'ppUrl': ppPath ?? "",
      });
      if (mounted) {
        final snackBar = ErrorSnackBar(
            content: "Congrats!, you have updated you profile successfully!");
        ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
      }

      return 'success';
    } catch (error) {
      final snackBar = ErrorSnackBar(
          content:
              "Unable to upload profile data, Please check you connection!");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
      }
      return "error";
    } finally {
      if (mounted) Navigator.of(context).pop();
    }
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
      }
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
    if (isNetworkImage) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Image.network(
          _ppUrl,
          fit: BoxFit.cover,
          width: getWidth(context) * 1 / 3 + 20,
          height: getWidth(context) * 1 / 3 + 20,
        ),
      );
    } else {
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

  Future<void> finishUpdatingProfile() async {
    String status = "";
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_ppPath != null) {
        String ppUploadResponse = await uploadImgToStorage();
        if (ppUploadResponse != "error") {
          status = await updateProfile(
            ppPath: ppUploadResponse,
            fName: _firstNameController.text,
            lName: _lastNameController.text,
            dept: _deptController.text,
            year: _yearController.text,
          );
        }
      } else {
        status = await updateProfile(
          fName: _firstNameController.text,
          lName: _lastNameController.text,
          dept: _deptController.text,
          year: _yearController.text,
        );
      }

      // sign in and go to home
      if (status == 'success') {
        singIn();
      }
    }
  }

  Future<String> uploadImgToStorage() async {
    LoadingSpinner.load(context);
    try {
      final uid = _currentUser!.uid;
      final Reference storageRef =
          FirebaseStorage.instance.ref().child("profile_pic/$uid.jpg");
      UploadTask uploadTask = storageRef.putFile(_ppPath!);
      await uploadTask.whenComplete(() => null);
      String ppUrl = await storageRef.getDownloadURL();
      return ppUrl;
    } catch (error) {
      final snackBar = ErrorSnackBar(
          content:
              "Unable to upload profile picture, please check your connection!");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
      }
      return "error";
    } finally {
      if (mounted) Navigator.of(context).pop();
    }
  }

  Future<void> singIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.email!, password: widget.password!);
      widget.toggleToLogin!();
    } on FirebaseAuthException catch (error) {
      final snackBar =
          ErrorSnackBar(content: "Unable to sign in, ${error.code}");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar());
      }
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
              onPressed: () => singIn(),
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
