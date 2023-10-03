import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  final String estBud;
  final String actspt;
  final String variance;
  final String utilsation;
  final String shoot;
  final String difference;
  const MyDataTable({
    super.key,
    required this.estBud,
    required this.actspt,
    required this.variance,
    required this.utilsation,
    required this.shoot,
    required this.difference,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'estimated budget',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              'Actual Spent',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              'Variance',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              '% Of Utilisation',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              '% Of Shoot',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              'Difference',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              estBud,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              actspt,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              variance,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              utilsation,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              shoot,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            ),
            Text(
              difference,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(200, 57, 57, 57),
              ),
            )
          ],
        ),
      ],
    );
  }
}
