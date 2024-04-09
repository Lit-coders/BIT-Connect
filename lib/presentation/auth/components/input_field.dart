import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final double width;
  final String hintText;
  final bool isReadOnly;
  final bool hasObscure;
  bool? isObscured;
  final Function(String) onChange;
  InputField({
    super.key,
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
      controller: widget.controller,
      onChanged: widget.onChange,
      readOnly: widget.isReadOnly,
      obscureText: widget.isObscured ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(90, 0, 0, 0),
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget getPWField() {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: widget.width * 2 / 3,
            child: getField(),
          ),
          IconButton(
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
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(
          color: const Color.fromARGB(100, 0, 0, 0),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: widget.hasObscure ? getPWField() : getField(),
    );
  }
}
