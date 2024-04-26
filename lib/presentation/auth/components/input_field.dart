import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  final String? Function(String?) validator;
  final TextEditingController controller;
  final double width;
  final String hintText;
  final bool isReadOnly;
  final bool hasObscure;
  bool? isObscured;
  final void Function(String?) onChange;
  InputField({
    super.key,
    required this.validator,
    required this.controller,
    required this.width,
    required this.hintText,
    required this.isReadOnly,
    required this.hasObscure,
    required this.onChange,
    this.isObscured,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  Widget getField() {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      onChanged: widget.onChange,
      readOnly: widget.isReadOnly,
      obscureText: widget.isObscured ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(90, 0, 0, 0),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Color.fromARGB(100, 0, 0, 0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            width: 2.0,
            color: Color.fromARGB(255, 87, 172, 246),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      ),
    );
  }

  Widget getPWField() {
    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            width: widget.width,
            child: getField(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  widget.isObscured = !(widget.isObscured ?? false);
                });
              },
              icon: Icon(
                widget.isObscured ?? true
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.black45,
                size: 23,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: widget.hasObscure ? getPWField() : getField(),
    );
  }
}
