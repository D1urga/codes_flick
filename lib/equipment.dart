import 'dart:convert';

import 'package:dio/dio.dart' show Dio, Response;
import 'package:flick_analytics/utils/log_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class Album {
  final dynamic category;
  const Album({
    required this.category,
  });
  factory Album.fromJson(Map<dynamic, dynamic> json) {
    return Album(
      category: json["logs"],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.flickanalytics.in/FlickReportsAPIs/fetch_equipment_logs.php'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

final equipmentLogKey1 = GlobalKey<FormState>();
final equipmentLogKey2 = GlobalKey<FormState>();
final equipmentLogKey3 = GlobalKey<FormState>();

class EquipmentLog extends StatefulWidget {
  const EquipmentLog({super.key});

  @override
  State<EquipmentLog> createState() => _EquipmentLogState();
}

int page = 1;
bool opacity = true;
const List<String> particularslist = <String>['ARRI ', 'Two', 'Three', 'Four'];
const List<String> activitytypelist = <String>['shoot', 'non-shoot'];

TextEditingController slCont = TextEditingController();
TextEditingController particulars = TextEditingController();
TextEditingController quantity = TextEditingController();
TextEditingController vendorname = TextEditingController();
TextEditingController activitytype = TextEditingController();
TextEditingController numberofattendant = TextEditingController();
TextEditingController numberofcallsheet = TextEditingController();
TextEditingController remarks = TextEditingController();
TextEditingController calltime = TextEditingController();
TextEditingController intime = TextEditingController();
TextEditingController outime = TextEditingController();
TextEditingController shootdate = TextEditingController();
TextEditingController searchController = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController shootdatefilter = TextEditingController();
TextEditingController slfilter = TextEditingController();
TextEditingController particularsfilter = TextEditingController();
TextEditingController activitytypefilter = TextEditingController();
TextEditingController quantityfilter = TextEditingController();
TextEditingController remarksfilter = TextEditingController();
String slstring = "";
String shootstring = "";
String particularsstring = "";
String activitytypestring = "";
String quantitystring = "";
String remarksstring = "";

class _EquipmentLogState extends State<EquipmentLog> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

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
                height: 84.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(
                        //   height: 50,
                        // ),
                        // Container(
                        //   padding: const EdgeInsets.only(left: 30, right: 24),
                        //   height: 20.h,
                        //   width: 84.w,
                        //   decoration: const BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(18)),
                        //       boxShadow: [
                        //         BoxShadow(
                        //             color: Color.fromARGB(100, 0, 0, 0),
                        //             blurRadius: 4)
                        //       ]),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Container(
                        //             height: 40,
                        //             width: 120,
                        //             decoration: const BoxDecoration(
                        //               color: Color.fromARGB(255, 136, 108, 192),
                        //               borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(18),
                        //                   bottomLeft: Radius.circular(16)),
                        //             ),
                        //             child: const Center(
                        //               child: Text(
                        //                 'Choose file',
                        //                 style: TextStyle(
                        //                     fontSize: 16, color: Colors.white),
                        //               ),
                        //             ),
                        //           ),
                        //           Container(
                        //             height: 40,
                        //             width: 120,
                        //             decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: const BorderRadius.only(
                        //                   topRight: Radius.circular(18),
                        //                   bottomRight: Radius.circular(16)),
                        //               border: Border.all(
                        //                   color: const Color.fromARGB(
                        //                       255, 136, 108, 192),
                        //                   width: 1),
                        //             ),
                        //             child: const Center(
                        //               child: Text(
                        //                 'Select a sheet ..',
                        //                 style: TextStyle(
                        //                     fontSize: 12,
                        //                     color: Color.fromARGB(
                        //                         127, 57, 57, 57)),
                        //               ),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //       Container(
                        //         height: 40,
                        //         width: 120,
                        //         decoration: const BoxDecoration(
                        //           color: Color.fromARGB(255, 136, 108, 192),
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(16),
                        //           ),
                        //         ),
                        //         child: const Center(
                        //           child: Text(
                        //             'Upload',
                        //             style: TextStyle(
                        //                 fontSize: 16, color: Colors.white),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(height: 24),
                        AnimatedOpacity(
                          curve: Curves.easeInExpo,
                          opacity: opacity ? 1 : 0.2,
                          duration: const Duration(milliseconds: 300),
                          child: SizedBox(
                              child: Column(
                            children: [
                              if (page ==
                                  1) //////////////////////////////////////////////////////////////////////////////////
                                Form(
                                  key: equipmentLogKey1,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24, bottom: 24),
                                        width: 84.w,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromARGB(
                                                      100, 0, 0, 0),
                                                  blurRadius: 4)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  136,
                                                                  108,
                                                                  192),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  180,
                                                                  179,
                                                                  181),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  180,
                                                                  179,
                                                                  181),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Row(
                                              children: [
                                                Text(
                                                  'Shoot Date',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  '*',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                selectDate();
                                              },
                                              child: IgnorePointer(
                                                child: LogTextField(
                                                  hintText: '09-07-2023',
                                                  icn: Icons.calendar_month,
                                                  showIcon: true,
                                                  readonly: true,
                                                  validator: (value) {},
                                                  fieldWidth: 154,
                                                  textSize: 15,
                                                  fn: () {},
                                                  cont: shootdate,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'SL',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            LogTextField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Field Required';
                                                }
                                                return null;
                                              },
                                              hintText: '',
                                              icn: Icons.keyboard_arrow_down,
                                              showIcon: false,
                                              readonly: false,
                                              fieldWidth: 252,
                                              textSize: 15,
                                              cont: slCont,
                                              fn: () {},
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Row(
                                              children: [
                                                Text(
                                                  'Particulars',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  '*',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: DropdownButton(
                                                isExpanded: true,
                                                icon: const SizedBox.shrink(),
                                                dropdownColor:
                                                    const Color.fromARGB(
                                                        255, 143, 153, 205),
                                                elevation: 16,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(25)),
                                                items: particularslist.map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    particulars.text = value!;
                                                  });
                                                },
                                                underline: Center(
                                                  child: IgnorePointer(
                                                    child: LogTextField(
                                                      hintText: 'Select...',
                                                      icn: Icons
                                                          .keyboard_arrow_down,
                                                      showIcon: true,
                                                      validator: (value) {},
                                                      readonly: true,
                                                      fn: () {},
                                                      fieldWidth: 252,
                                                      textSize: 15,
                                                      cont: particulars,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'Quantity',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            LogTextField(
                                              hintText: '',
                                              icn: Icons.keyboard_arrow_down,
                                              showIcon: false,
                                              readonly: false,
                                              fieldWidth: 252,
                                              validator: (value) {},
                                              fn: () {},
                                              textSize: 15,
                                              cont: quantity,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Row(
                                              children: [
                                                Text(
                                                  'Vendor Name',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  '*',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            LogTextField(
                                              hintText: '',
                                              icn: Icons.keyboard_arrow_down,
                                              showIcon: false,
                                              readonly: false,
                                              fieldWidth: 252,
                                              fn: () {},
                                              validator: (value) {},
                                              textSize: 15,
                                              cont: vendorname,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      opacity = false;
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  300), () {
                                                        setState(() {
                                                          opacity = true;
                                                          page = 2;
                                                        });
                                                      });
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 90,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 136, 108, 192),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Next ',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (page ==
                                  2) ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                Form(
                                  key: equipmentLogKey2,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24, bottom: 24),
                                        width: 84.w,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromARGB(
                                                      100, 0, 0, 0),
                                                  blurRadius: 4)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  136,
                                                                  108,
                                                                  192),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  136,
                                                                  108,
                                                                  192),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  156,
                                                                  155,
                                                                  158),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Activity Type',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: DropdownButton(
                                                isExpanded: true,
                                                icon: const SizedBox.shrink(),
                                                dropdownColor:
                                                    const Color.fromARGB(
                                                        255, 143, 153, 205),
                                                elevation: 16,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(25)),
                                                items: activitytypelist.map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    activitytype.text = value!;
                                                  });
                                                },
                                                underline: Center(
                                                  child: IgnorePointer(
                                                    child: LogTextField(
                                                      hintText: 'Select...',
                                                      icn: Icons
                                                          .keyboard_arrow_down,
                                                      validator: (value) {},
                                                      showIcon: true,
                                                      readonly: true,
                                                      fn: () {},
                                                      fieldWidth: 252,
                                                      textSize: 15,
                                                      cont: activitytype,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'Number of Attendants',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            LogTextField(
                                              hintText: '',
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Field Required';
                                                }
                                                return null;
                                              },
                                              icn: Icons.keyboard_arrow_down,
                                              showIcon: false,
                                              readonly: false,
                                              fn: () {},
                                              fieldWidth: 252,
                                              textSize: 15,
                                              cont: numberofattendant,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'Number of Call Sheets',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            LogTextField(
                                              hintText: '',
                                              icn: Icons.keyboard_arrow_down,
                                              showIcon: false,
                                              readonly: false,
                                              fieldWidth: 252,
                                              textSize: 15,
                                              fn: () {},
                                              validator: (value) {},
                                              cont: numberofcallsheet,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'Remarks',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            LogTextField(
                                              hintText: '',
                                              icn: Icons.keyboard_arrow_down,
                                              showIcon: false,
                                              fn: () {},
                                              validator: (value) {},
                                              readonly: false,
                                              fieldWidth: 252,
                                              textSize: 15,
                                              cont: remarks,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      opacity = false;
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  300), () {
                                                        setState(() {
                                                          opacity = true;
                                                          page = 1;
                                                        });
                                                      });
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 90,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Back ',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    136,
                                                                    108,
                                                                    192),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      opacity = false;
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  300), () {
                                                        setState(() {
                                                          opacity = true;
                                                          page = 3;
                                                        });
                                                      });
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 90,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 136, 108, 192),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Next ',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (page ==
                                  3) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                Form(
                                  key: equipmentLogKey3,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24, bottom: 24),
                                        width: 84.w,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromARGB(
                                                      100, 0, 0, 0),
                                                  blurRadius: 4)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  136,
                                                                  108,
                                                                  192),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  136,
                                                                  108,
                                                                  192),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                                Container(
                                                  height: 12,
                                                  width: 83,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  136,
                                                                  108,
                                                                  192),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Call Time',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final TimeOfDay? time =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now());
                                                if (time != null) {
                                                  String mypickedtime =
                                                      '${time.hour}:${time.minute}:00';

                                                  calltime.text = DateFormat
                                                          .jm()
                                                      .format(DateFormat(
                                                              "hh:mm:ss")
                                                          .parse(mypickedtime));
                                                }
                                              },
                                              child: IgnorePointer(
                                                child: LogTextField(
                                                  hintText: '--:--',
                                                  fn: () {},
                                                  icn: Icons.access_time,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Field Required';
                                                    }
                                                    return null;
                                                  },
                                                  showIcon: true,
                                                  readonly: true,
                                                  fieldWidth: 154,
                                                  textSize: 15,
                                                  cont: calltime,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'In Time',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final TimeOfDay? time =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now());
                                                if (time != null) {
                                                  String mypickedtime =
                                                      '${time.hour}:${time.minute}:00';

                                                  intime.text = DateFormat.jm()
                                                      .format(DateFormat(
                                                              "hh:mm:ss")
                                                          .parse(mypickedtime));
                                                }
                                              },
                                              child: IgnorePointer(
                                                child: LogTextField(
                                                  hintText: '--:--',
                                                  icn: Icons.access_time,
                                                  showIcon: true,
                                                  fn: () {},
                                                  readonly: true,
                                                  validator: (value) {},
                                                  fieldWidth: 154,
                                                  textSize: 15,
                                                  cont: intime,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'Out Times',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final TimeOfDay? time =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now());
                                                if (time != null) {
                                                  String mypickedtime =
                                                      '${time.hour}:${time.minute}:00';

                                                  outime.text = DateFormat.jm()
                                                      .format(DateFormat(
                                                              "hh:mm:ss")
                                                          .parse(mypickedtime));
                                                }
                                              },
                                              child: IgnorePointer(
                                                child: LogTextField(
                                                  hintText: '--:--',
                                                  fn: () {},
                                                  icn: Icons.access_time,
                                                  validator: (value) {},
                                                  showIcon: true,
                                                  readonly: true,
                                                  fieldWidth: 154,
                                                  textSize: 15,
                                                  cont: outime,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      opacity = false;
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  200), () {
                                                        setState(() {
                                                          opacity = true;
                                                          page = 2;
                                                        });
                                                      });
                                                    });
                                                  },
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        opacity = false;
                                                        Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    300), () {
                                                          setState(() {
                                                            opacity = true;
                                                            page = 2;
                                                          });
                                                        });
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 40,
                                                      width: 90,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(12),
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          'Back',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      136,
                                                                      108,
                                                                      192),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (equipmentLogKey3
                                                        .currentState!
                                                        .validate()) {
                                                      sendEquipmentData();
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 90,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 136, 108, 192),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(12),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Add Log',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 82.w,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(100, 0, 0, 0),
                                    blurRadius: 4)
                              ]),
                          child: Theme(
                            data: ThemeData()
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                                title: const Text(
                                  'Filters',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 37, 36, 36),
                                      fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 24, right: 24, bottom: 12),
                                    height: 245,
                                    width: 84.w,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Shoot Date',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 36.w,
                                              child: InkWell(
                                                onTap: () {
                                                  chooseDate();
                                                },
                                                child: IgnorePointer(
                                                  child: TextField(
                                                    onChanged: (value) {
                                                      setState(() {
                                                        shootstring = value;
                                                      });
                                                    },
                                                    controller: shootdatefilter,
                                                    decoration:
                                                        const InputDecoration(
                                                            suffixIconConstraints: BoxConstraints(
                                                                minHeight: 30,
                                                                minWidth: 34),
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .calendar_today_rounded,
                                                              size: 22,
                                                            ),
                                                            isDense: true,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    8),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    width: 1,
                                                                    color: Color.fromARGB(
                                                                        255,
                                                                        153,
                                                                        152,
                                                                        152),
                                                                    style: BorderStyle
                                                                        .solid),
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(
                                                                        13))),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    width: 1.4,
                                                                    color: Color.fromARGB(255, 2, 2, 2),
                                                                    style: BorderStyle.solid),
                                                                borderRadius: BorderRadius.all(Radius.circular(13)))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Particulars',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 36.w,
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    particularsstring = value;
                                                  });
                                                },
                                                controller: particularsfilter,
                                                decoration:
                                                    const InputDecoration(
                                                        suffixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 30,
                                                                minWidth: 34),
                                                        suffixIcon: Icon(
                                                          Icons.filter_alt,
                                                          size: 22,
                                                        ),
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(
                                                                    255, 153, 152, 152),
                                                                style: BorderStyle
                                                                    .solid),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        13))),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1.4,
                                                                color: Color.fromARGB(255, 2, 2, 2),
                                                                style: BorderStyle.solid),
                                                            borderRadius: BorderRadius.all(Radius.circular(13)))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Activity Type',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 36.w,
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    activitytypestring = value;
                                                  });
                                                },
                                                controller: activitytypefilter,
                                                decoration:
                                                    const InputDecoration(
                                                        suffixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 30,
                                                                minWidth: 34),
                                                        suffixIcon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 22,
                                                        ),
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(
                                                                    255, 153, 152, 152),
                                                                style: BorderStyle
                                                                    .solid),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        13))),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1.4,
                                                                color: Color.fromARGB(255, 2, 2, 2),
                                                                style: BorderStyle.solid),
                                                            borderRadius: BorderRadius.all(Radius.circular(13)))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Quantity',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 36.w,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (value) {
                                                  setState(() {
                                                    quantitystring = value;
                                                  });
                                                },
                                                controller: quantityfilter,
                                                decoration:
                                                    const InputDecoration(
                                                        suffixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 30,
                                                                minWidth: 34),
                                                        suffixIcon: Icon(
                                                          Icons.filter_alt,
                                                          size: 22,
                                                        ),
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(
                                                                    255, 153, 152, 152),
                                                                style: BorderStyle
                                                                    .solid),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        13))),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1.4,
                                                                color: Color.fromARGB(255, 2, 2, 2),
                                                                style: BorderStyle.solid),
                                                            borderRadius: BorderRadius.all(Radius.circular(13)))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Remarks',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 36.w,
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    remarksstring = value;
                                                  });
                                                },
                                                controller: remarksfilter,
                                                decoration:
                                                    const InputDecoration(
                                                        suffixIconConstraints:
                                                            BoxConstraints(
                                                                minHeight: 30,
                                                                minWidth: 34),
                                                        suffixIcon: Icon(
                                                          Icons.filter_alt,
                                                          size: 22,
                                                        ),
                                                        isDense: true,
                                                        contentPadding:
                                                            EdgeInsets.all(8),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(
                                                                    255, 153, 152, 152),
                                                                style: BorderStyle
                                                                    .solid),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        13))),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1.4,
                                                                color: Color.fromARGB(255, 2, 2, 2),
                                                                style: BorderStyle.solid),
                                                            borderRadius: BorderRadius.all(Radius.circular(13)))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  // isclear = !isclear;
                                                  shootdatefilter.text = '';
                                                  particularsstring = "";
                                                  particularsfilter.text = "";
                                                  activitytypefilter.text = '';
                                                  activitytypestring = "";
                                                  quantityfilter.text = '';
                                                  quantitystring = "";
                                                  remarksfilter.text = '';
                                                  remarksstring = "";
                                                  // isclear = !isclear;
                                                });
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                height: 33,
                                                width: 100,
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //       color: Color.fromARGB(
                                                  //           100, 0, 0, 0),
                                                  //       blurRadius: 3)
                                                  // ]
                                                ),
                                                child: const Center(
                                                    child: Text(
                                                  'Clear All',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 255),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
////////////////////////////////////////////////////////////////////////////////////////
                        FutureBuilder<Album>(
                          future: futureAlbum,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  Container(
                                    height: 53.h,
                                    width: 84.w,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: snapshot
                                                  .data!.category.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Center(
                                                  child: Column(
                                                    children: [
                                                      if (snapshot
                                                              .data!
                                                              .category[index]
                                                                  ["sl"]
                                                              .contains(
                                                                  slstring) &&
                                                          snapshot
                                                              .data!
                                                              .category[index][
                                                                  "particulars"]
                                                              .contains(
                                                                  particularsstring) &&
                                                          snapshot
                                                              .data!
                                                              .category[index]
                                                                  ["quantity"]
                                                              .contains(
                                                                  quantitystring) &&
                                                          snapshot
                                                              .data!
                                                              .category[index]
                                                                  ["remarks"]
                                                              .contains(
                                                                  remarksstring) &&
                                                          snapshot
                                                              .data!
                                                              .category[index]
                                                                  ["shoot_date"]
                                                              .contains(
                                                                  shootdatefilter.text))
                                                        InkWell(
                                                          onTap: () {
                                                            showModalBottomSheet<
                                                                void>(
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            35.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            35.0)),
                                                              ),
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    top: 24,
                                                                    left: 50,
                                                                    right: 50,
                                                                  ),
                                                                  height: 52.h,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                110,
                                                                            height:
                                                                                7,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: const Color.fromARGB(255, 136, 108, 192),
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Sl',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(200, 57, 57, 57),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Shoot Date',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(200, 57, 57, 57),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            snapshot.data!.category[index]["sl"],
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(199, 0, 0, 0),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            snapshot.data!.category[index]["shoot_date"],
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(199, 0, 0, 0),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      const Text(
                                                                        'Description',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: Color.fromARGB(
                                                                              200,
                                                                              57,
                                                                              57,
                                                                              57),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        snapshot
                                                                            .data!
                                                                            .category[index]["particulars"],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: Color.fromARGB(
                                                                              199,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      const Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Quantity',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(200, 57, 57, 57),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            'Activity Type',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(200, 57, 57, 57),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            snapshot.data!.category[index]["quantity"],
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(199, 0, 0, 0),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            snapshot.data!.category[index]["activity_type"],
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color.fromARGB(199, 0, 0, 0),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      const Text(
                                                                        'Remarks',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: Color.fromARGB(
                                                                              200,
                                                                              57,
                                                                              57,
                                                                              57),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        snapshot
                                                                            .data!
                                                                            .category[index]["remarks"],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: Color.fromARGB(
                                                                              199,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                        ),
                                                                      ),
                                                                      // const SizedBox(
                                                                      //   height:
                                                                      //       20,
                                                                      // ),
                                                                      // Row(
                                                                      //   mainAxisAlignment:
                                                                      //       MainAxisAlignment.spaceBetween,
                                                                      //   children: [
                                                                      //     Container(
                                                                      //       height:
                                                                      //           40,
                                                                      //       width:
                                                                      //           100,
                                                                      //       decoration:
                                                                      //           const BoxDecoration(
                                                                      //         color: Colors.red,
                                                                      //         borderRadius: BorderRadius.all(
                                                                      //           Radius.circular(12),
                                                                      //         ),
                                                                      //       ),
                                                                      //       child:
                                                                      //           const Center(
                                                                      //         child: Text(
                                                                      //           'Delete',
                                                                      //           style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                                                      //         ),
                                                                      //       ),
                                                                      //     ),
                                                                      //     Container(
                                                                      //       height:
                                                                      //           40,
                                                                      //       width:
                                                                      //           128,
                                                                      //       decoration:
                                                                      //           const BoxDecoration(
                                                                      //         color: Color.fromARGB(255, 136, 108, 192),
                                                                      //         borderRadius: BorderRadius.all(
                                                                      //           Radius.circular(12),
                                                                      //         ),
                                                                      //       ),
                                                                      //       child:
                                                                      //           const Center(
                                                                      //         child: Text(
                                                                      //           'Apply Now',
                                                                      //           style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                                                      //         ),
                                                                      //       ),
                                                                      //     ),
                                                                      //   ],
                                                                      // ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(14),
                                                            height: 12.8.h,
                                                            width:
                                                                double.infinity,
                                                            decoration: const BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(Radius.circular(
                                                                            16)),
                                                                color: Colors.white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              100,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      blurRadius:
                                                                          4)
                                                                ]),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Icon(
                                                                        Icons
                                                                            .notes_rounded,
                                                                        color: Color.fromARGB(
                                                                            197,
                                                                            0,
                                                                            0,
                                                                            0)),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .category[index]["sl"],
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Color.fromARGB(
                                                                            200,
                                                                            57,
                                                                            57,
                                                                            57),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    const Icon(
                                                                        Icons
                                                                            .article_outlined,
                                                                        color: Color.fromARGB(
                                                                            199,
                                                                            0,
                                                                            0,
                                                                            0)),
                                                                    SizedBox(
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data!
                                                                            .category[index]["particulars"],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: Color.fromARGB(
                                                                              200,
                                                                              57,
                                                                              57,
                                                                              57),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Icon(
                                                                        Icons
                                                                            .shopping_bag_outlined,
                                                                        color: Color.fromARGB(
                                                                            199,
                                                                            0,
                                                                            0,
                                                                            0)),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .category[index]["quantity"],
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Color.fromARGB(
                                                                            200,
                                                                            57,
                                                                            57,
                                                                            57),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    const Icon(
                                                                        Icons
                                                                            .edit_note_outlined,
                                                                        size:
                                                                            25,
                                                                        color: Color.fromARGB(
                                                                            199,
                                                                            0,
                                                                            0,
                                                                            0)),
                                                                    SizedBox(
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data!
                                                                            .category[index]["remarks"],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: Color.fromARGB(
                                                                              200,
                                                                              57,
                                                                              57,
                                                                              57),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 80,
                                  width: 280,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(62, 0, 0, 0),
                                            blurRadius: 24)
                                      ]),
                                  child: const Center(
                                    child: Text(
                                        'Something went wrong Please check your internet connection'),
                                  ));
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 85.5.h,
              left: 30,
              child: const Row(
                children: [
                  Icon(
                    Icons.list_alt_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Equipment Logs',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 89.5.h,
              left: 30,
              child: Transform.rotate(
                angle: 3.14,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '➜',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void setTime(TextEditingController cn) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      String mypickedtime = '${time.hour}:${time.minute}:00';
      String totime =
          DateFormat.jm().format(DateFormat("hh:mm:ss").parse(mypickedtime));

      cn.text = totime;
    }
  }

  DateTime selectedDate = DateTime.now();
  void selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      shootdate.text = picked.toString();
    }
  }

  Future<Response?> sendEquipmentData() async {
    var dio = Dio();
    try {
      // setState(() {
      //   isLoading = false;
      // });
      var response = await dio.post(
        'https://api.flickanalytics.in/FlickReportsAPIs/fetch_equipment_logs.php',
        data: {
          "sl": slCont.text,
          "particulars": particulars.text,
          "vendor": vendorname.text,
          "shoot_date": shootdate.text,
          "activity_type": activitytype.text,
          "quantity": quantity.text,
          "call_time": calltime.text,
          "in_time": intime.text,
          "out_time": outime.text,
          "no_of_attendants": numberofattendant.text,
          "no_of_callsheet": numberofcallsheet.text,
          "remarks": remarks.text,
          "num_row": "53"
        },
      );
      print(response.data['success']);

      print(response.statusCode);
      if (response.data['success'] == true) {
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.setString("email", cn1.text);
        print('successfull');
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => const HomePage()));
        showMyDialog();
      }
      // setState(() {
      //   isLoading = true;
      // });
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data Response'),
          content: const SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Your data has successfully send'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void chooseDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        shootdatefilter.text = picked.toString().substring(0, 10);
      });
    }
  }
}
