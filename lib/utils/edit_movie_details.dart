import 'package:flutter/material.dart';

import 'edit_movie_text_field.dart';

class EditMovieDetails extends StatefulWidget {
  final TextEditingController ct1;
  final TextEditingController ct2;
  final TextEditingController ct3;
  final TextEditingController ct4;
  final TextEditingController ct5;
  final TextEditingController ct6;
  final Function() fnc;
  const EditMovieDetails(
      {super.key,
      required this.ct1,
      required this.ct2,
      required this.ct3,
      required this.ct4,
      required this.ct5,
      required this.ct6,
      required this.fnc});

  @override
  State<EditMovieDetails> createState() => _EditMovieDetailsState();
}

class _EditMovieDetailsState extends State<EditMovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Movie Settings',
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Movie Name',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 57, 57, 57),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              EditMovieTextField(
                cont: widget.ct1,
                hinttext: 'Movie Name',
                onMyTap: () {},
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Director Name',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 57, 57, 57),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              EditMovieTextField(
                onMyTap: () {},
                cont: widget.ct2,
                hinttext: 'Director Name',
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'DOP',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 57, 57, 57),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              EditMovieTextField(
                onMyTap: () {},
                cont: widget.ct3,
                hinttext: 'DOP',
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Art Director',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 57, 57, 57),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              EditMovieTextField(
                onMyTap: () {},
                cont: widget.ct4,
                hinttext: 'Art Director',
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Music Director',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 57, 57, 57),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              EditMovieTextField(
                onMyTap: () {},
                cont: widget.ct5,
                hinttext: 'Music Director',
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Executive Producer',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 57, 57, 57),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              EditMovieTextField(
                onMyTap: () {},
                cont: widget.ct6,
                hinttext: 'Executive Producer',
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  widget.fnc();
                },
                child: Container(
                  height: 40,
                  width: 136,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 136, 108, 192),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    'Update Details',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
