// import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class FilterTextField extends StatefulWidget {
//   final void Function(String)? myfun;

//   const FilterTextField({super.key, required this.myfun});

//   @override
//   State<FilterTextField> createState() => _FilterTextFieldState();
// }

// class _FilterTextFieldState extends State<FilterTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       // onChanged: (value) {
//       //   setState(() {
//       //     searchString = value;
//       //   });
//       // },
//       onChanged: myfun,
//       controller: searchController,
//       decoration: const InputDecoration(
//           suffixIconConstraints: BoxConstraints(minHeight: 30, minWidth: 34),
//           suffixIcon: Icon(
//             Icons.filter_alt,
//             size: 22,
//           ),
//           hintText: "Sl",
//           isDense: true,
//           contentPadding: EdgeInsets.all(10),
//           enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   width: 1,
//                   color: Color.fromARGB(255, 153, 152, 152),
//                   style: BorderStyle.solid),
//               borderRadius: BorderRadius.all(Radius.circular(13))),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   width: 1.4,
//                   color: Color.fromARGB(255, 2, 2, 2),
//                   style: BorderStyle.solid),
//               borderRadius: BorderRadius.all(Radius.circular(13)))),
//     );
//   }
// }
