import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final double width;
  final String hintText;
  final bool readOnly;
  const InputField({
    super.key,
    required this.width,
    required this.hintText,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
      child: TextFormField(
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
