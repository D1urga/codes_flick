import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie Name',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'LAL SALAAM',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Director Name',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Aishwarya Rajinikanth',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'DOP',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Vishnu',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Art Director',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Ramu Thangaraj',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Music Director',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'AR Rahman',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Executive Producer',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Subramanian',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
