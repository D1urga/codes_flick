import 'package:flick_analytics/crew_log.dart';
import 'package:flick_analytics/equipment.dart';
import 'package:flick_analytics/food_logs.dart';
import 'package:flick_analytics/ground_log.dart';
import 'package:flick_analytics/lodging_log.dart';
import 'package:flick_analytics/other_log.dart';
import 'package:flick_analytics/property_logs.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import 'generator_page.dart';

class Sitelogs extends StatefulWidget {
  const Sitelogs({super.key});

  @override
  State<Sitelogs> createState() => _SitelogsState();
}

class _SitelogsState extends State<Sitelogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: 270.0,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 136, 108, 192),
                    Color.fromARGB(255, 4, 30, 68)
                  ])),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 83.5.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const PropertyLogs()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's8',
                                ),
                                Text(
                                  "Property",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const EquipmentLog()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's2',
                                ),
                                Text(
                                  'Equipment',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const GeneratorLogs()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's4',
                                ),
                                Text(
                                  "Generator",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const GroundLog()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's5',
                                ),
                                Text(
                                  'Ground Transport',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const CrewLog()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's1',
                                ),
                                Text(
                                  "Crew",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const LodgingLog()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's6',
                                ),
                                Text(
                                  'Lodging',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const FoodLog()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's3',
                                ),
                                Text(
                                  "Food",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 0),
                                    reverseDuration:
                                        const Duration(milliseconds: 0),
                                    child: const OtherLog()));
                          },
                          child: Container(
                            height: 17.2.h,
                            width: 37.4.w,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      blurRadius: 4)
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SiteLogImages(
                                  img: 's7',
                                ),
                                Text(
                                  'Other',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 4, 30, 68)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 84.h,
              left: 30,
              child: const Row(
                children: [
                  Icon(
                    Icons.list_alt_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sitelogs',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class SiteLogImages extends StatelessWidget {
  final String img;
  const SiteLogImages({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/$img.png');
    Image image = Image(image: assetImage);
    return SizedBox(
      height: 64,
      width: 64,
      child: image,
    );
  }
}
