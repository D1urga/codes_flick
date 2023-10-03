import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final double? utilisation;
  final double? shoot;
  final double? difference;
  const PageOne(
      {super.key,
      required this.utilisation,
      required this.shoot,
      required this.difference});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Admin and Pre Production',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: PieChart(PieChartData(
                        centerSpaceRadius: 40,
                        sectionsSpace: 5,
                        startDegreeOffset: 40,
                        centerSpaceColor: Colors.white,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sections: [
                          PieChartSectionData(
                              showTitle: false,
                              value: utilisation,
                              color: const Color.fromARGB(255, 72, 61, 95)),
                          PieChartSectionData(
                              showTitle: false,
                              value: shoot,
                              color: const Color.fromARGB(255, 136, 108, 192)),
                          PieChartSectionData(
                              showTitle: false,
                              value: difference,
                              color: const Color.fromARGB(255, 4, 30, 68)),
                        ])),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 32,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 136, 108, 192)),
                        ),
                        child: const Center(
                          child: Text(
                            'Utilisation',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 32,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 72, 61, 95)),
                        ),
                        child: const Center(
                          child: Text(
                            'Shoot',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 32,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 4, 30, 68)),
                        ),
                        child: const Center(
                          child: Text(
                            'Difference',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 136,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(62, 136, 108, 192),
                            blurRadius: 24)
                      ]),
                  child: const Center(
                    child: Text(
                      'Office Advance',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 108,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(62, 136, 108, 192),
                            blurRadius: 24)
                      ]),
                  child: const Center(
                    child: Text(
                      'Office Rent',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30,
                  width: 147,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(62, 136, 108, 192),
                            blurRadius: 24)
                      ]),
                  child: const Center(
                    child: Text(
                      'Office Boy Salary',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
