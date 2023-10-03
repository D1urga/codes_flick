import 'package:flutter/material.dart';

import 'edit_movie_text_field.dart';

class AddArtistes extends StatefulWidget {
  final TextEditingController ct1;
  final TextEditingController ct2;

  const AddArtistes({
    super.key,
    required this.ct1,
    required this.ct2,
  });

  @override
  State<AddArtistes> createState() => _AddArtistesState();
}

class _AddArtistesState extends State<AddArtistes> {
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
                'Role :',
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
                hinttext: 'Role ',
                onMyTap: () {},
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Name :',
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
                hinttext: 'Name',
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 88,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 9, 189, 60),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 88,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 136, 108, 192),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
