import 'package:flutter/material.dart';

class EditMovieTextField extends StatelessWidget {
  final TextEditingController cont;
  final String hinttext;
  final Function() onMyTap;
  const EditMovieTextField(
      {super.key,
      required this.cont,
      required this.hinttext,
      required this.onMyTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: cont,
      decoration: InputDecoration(
          hintText: hinttext,
          isDense: true,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 57, 57, 57),
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(2))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 57, 57, 57),
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(2))),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 57, 57, 57),
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(2)))),
    );
  }
}
