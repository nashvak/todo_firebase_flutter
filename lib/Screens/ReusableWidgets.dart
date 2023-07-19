import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
TextField ReusableTextfield(
  String text,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

ElevatedButton button(String name, Function onTap) {
  return ElevatedButton(
    style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(360, 50))),
    onPressed: () {
      onTap();
    },
    child: Text(name),
  );
}
