import 'package:flutter/material.dart';

class TextFieldUtil extends StatelessWidget {
  final String hintText;
  final int maxline;
  final double borderradius;
  final double fieldWidth;
  final double textSize;
  final bool readonly;
  final double conPadding;
  final TextEditingController cont;
  final double borderwidth;
  final Color color;
  final bool showIcon;
  const TextFieldUtil(
      {super.key,
      required this.hintText,
      required this.readonly,
      required this.maxline,
      required this.borderradius,
      required this.fieldWidth,
      required this.textSize,
      required this.cont,
      required this.conPadding,
      required this.showIcon,
      required this.color,
      required this.borderwidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth,
      child: TextField(
        obscureText: false,
        readOnly: readonly,
        controller: cont,
        maxLines: maxline,
        style: TextStyle(fontSize: textSize),
        decoration: InputDecoration(
            suffixIcon: showIcon
                ? const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Color.fromARGB(85, 115, 123, 139),
                  )
                : null,
            labelText: hintText,
            floatingLabelStyle: const TextStyle(
                height: 1.5,
                color: Color.fromARGB(255, 4, 30, 68),
                fontWeight: FontWeight.w600),
            isDense: true,
            contentPadding: EdgeInsets.all(conPadding),
            isCollapsed: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: borderwidth, color: color, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(borderradius))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: borderwidth, color: color, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(borderradius)))),
      ),
    );
  }
}
