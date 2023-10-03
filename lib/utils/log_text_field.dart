// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LogTextField extends StatelessWidget {
  final String hintText;
  final Function fn;
  final double fieldWidth;
  final double textSize;
  final bool readonly;
  final IconData icn;
  final TextEditingController cont;
  final String? Function(String? value)? validator;

  final bool showIcon;
  const LogTextField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.fn,
    required this.icn,
    required this.readonly,
    required this.fieldWidth,
    required this.textSize,
    required this.cont,
    required this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth,
      child: TextFormField(
        validator: validator,
        onTap: () {
          fn;
        },
        readOnly: readonly,
        controller: cont,
        maxLines: 1,
        style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            suffixIconConstraints:
                const BoxConstraints(minHeight: 30, minWidth: 34),
            suffixIcon: showIcon
                ? Icon(
                    icn,
                    size: 25,
                    color: const Color.fromARGB(83, 74, 74, 80),
                  )
                : null,
            hintText: hintText,
            floatingLabelStyle: const TextStyle(
                height: 1.5,
                color: Color.fromARGB(255, 22, 22, 22),
                fontWeight: FontWeight.w600),
            isDense: true,
            contentPadding: const EdgeInsets.all(10),
            isCollapsed: true,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 153, 152, 152),
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(13))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.4,
                    color: Color.fromARGB(255, 2, 2, 2),
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(13)))),
      ),
    );
  }
}
