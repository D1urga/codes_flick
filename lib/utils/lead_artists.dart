import 'package:flutter/material.dart';

class LeadArtists extends StatelessWidget {
  const LeadArtists({super.key});

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
                'Main Lead',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'LAL SALAAM',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.delete,
                    size: 18,
                    color: Color.fromARGB(255, 136, 108, 192),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Hero 1',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Aishwarya Rajinikanth',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.delete,
                    size: 18,
                    color: Color.fromARGB(255, 136, 108, 192),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Hero 2',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 136, 108, 192),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Vishnu',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.delete,
                    size: 18,
                    color: Color.fromARGB(255, 136, 108, 192),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
