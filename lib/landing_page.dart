import 'package:flick_analytics/utils/add_artists.dart';
import 'package:flick_analytics/utils/edit_movie_details.dart';
import 'package:flick_analytics/utils/lead_artists.dart';
import 'package:flick_analytics/utils/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isMovieDetail = true;
  bool isLeadArtist = true;
  bool opacity = true;
  bool isMovieDetailPage = true;
  TextEditingController ct1 = TextEditingController(text: 'Lal Salaam');
  TextEditingController ct2 =
      TextEditingController(text: 'Aishwarya Rajnikanth');
  TextEditingController ct3 = TextEditingController(text: 'Vishnu');
  TextEditingController ct4 = TextEditingController(text: 'Ramu Thangaraj');
  TextEditingController ct5 = TextEditingController(text: 'AR Rahman');
  TextEditingController ct6 = TextEditingController(text: 'Subramanian');
  TextEditingController ct7 = TextEditingController();
  TextEditingController act1 = TextEditingController();
  TextEditingController act2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              height: 50.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/img1.jpg'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 69.h,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 4, 30, 68),
                          spreadRadius: 40,
                          blurRadius: 40)
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 44,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isMovieDetailPage = true;
                              });
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SiteLogImages(
                                    img: 'movie',
                                  ),
                                  Text(
                                    'Movie Details',
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
                              setState(() {
                                isMovieDetailPage = false;
                              });
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SiteLogImages(
                                    img: 'lead',
                                  ),
                                  Text(
                                    'Lead Artists',
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
                      const SizedBox(height: 36),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        reverseDuration: const Duration(milliseconds: 200),
                        switchInCurve: Curves.easeInExpo,
                        switchOutCurve: Curves.easeInExpo,
                        transitionBuilder:
                            (Widget child, Animation<double> animation) =>
                                ScaleTransition(
                          scale: animation,
                          alignment: Alignment.topCenter,
                          child: child,
                        ),
                        child: isMovieDetailPage
                            ? Container(
                                key: const ValueKey(1),
                                padding: const EdgeInsets.all(8),
                                // height: 750,
                                width: 84.w,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(100, 0, 0, 0),
                                          blurRadius: 4)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isMovieDetail = true;
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 4,
                                                left: 4,
                                                right: 4,
                                                bottom: 0),
                                            child: Text(
                                              'Movie Details',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isMovieDetail = false;
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 4,
                                                left: 4,
                                                right: 4,
                                                bottom: 0),
                                            child: Text(
                                              'Edit Details',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Divider(
                                            color: !isMovieDetail
                                                ? const Color.fromARGB(
                                                    255, 222, 226, 230)
                                                : const Color.fromARGB(
                                                    255, 136, 108, 192),
                                            thickness: 2,
                                            endIndent: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: Divider(
                                            color: isMovieDetail
                                                ? const Color.fromARGB(
                                                    255, 222, 226, 230)
                                                : const Color.fromARGB(
                                                    255, 136, 108, 192),
                                            thickness: 2,
                                            indent: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      reverseDuration:
                                          const Duration(milliseconds: 500),
                                      switchInCurve: Curves.easeInExpo,
                                      switchOutCurve: Curves.easeInExpo,
                                      child: isMovieDetail
                                          ? const MovieDetails()
                                          : EditMovieDetails(
                                              fnc: () {
                                                setState(() {});
                                              },
                                              ct1: ct1,
                                              ct2: ct2,
                                              ct3: ct3,
                                              ct4: ct4,
                                              ct5: ct5,
                                              ct6: ct6),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                key: const ValueKey(2),
                                padding: const EdgeInsets.all(8),
                                // height: 750,
                                width: 84.w,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(100, 0, 0, 0),
                                          blurRadius: 4)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isLeadArtist = true;
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 4,
                                                left: 4,
                                                right: 4,
                                                bottom: 0),
                                            child: Text(
                                              'Lead Artist',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192)),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isLeadArtist = false;
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 4,
                                                left: 4,
                                                right: 4,
                                                bottom: 0),
                                            child: Text(
                                              '+ Artists',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Divider(
                                            color: !isLeadArtist
                                                ? const Color.fromARGB(
                                                    255, 222, 226, 230)
                                                : const Color.fromARGB(
                                                    255, 136, 108, 192),
                                            thickness: 2,
                                            endIndent: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: Divider(
                                            color: isLeadArtist
                                                ? const Color.fromARGB(
                                                    255, 222, 226, 230)
                                                : const Color.fromARGB(
                                                    255, 136, 108, 192),
                                            thickness: 2,
                                            indent: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      reverseDuration:
                                          const Duration(milliseconds: 500),
                                      switchInCurve: Curves.easeInExpo,
                                      switchOutCurve: Curves.easeInExpo,
                                      child: isLeadArtist
                                          ? const LeadArtists()
                                          : AddArtistes(
                                              ct1: act1,
                                              ct2: act2,
                                            ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 69.5.h,
              left: 30,
              child: const Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ));
  }
}

class LalSalaamImageAsset extends StatelessWidget {
  const LalSalaamImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/img1.jpg');
    Image image = Image(image: assetImage);
    return image;
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
