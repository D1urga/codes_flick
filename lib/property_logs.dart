import 'dart:convert';
// import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import 'utils/log_text_field.dart';

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
      'https://api.flickanalytics.in/FlickReportsAPIs/fetch_property_logs.php'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

dynamic fetchData() async {
  final response = await http.get(Uri.parse(
      'https://api.flickanalytics.in/FlickReportsAPIs/fetch_property_logs.php'));
  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    print(responseData["logs"]);
    return responseData["logs"];
  } else {
    throw Exception('Failed to load album');
  }
}

class PropertyLogs extends StatefulWidget {
  const PropertyLogs({super.key});
  @override
  State<PropertyLogs> createState() => _PropertyLogsState();
}

String searchString = "";
String datestring = "";
const List<String> descriptionlist = <String>['one ', 'Two', 'Three', 'Four'];
const List<String> activitytypelist = <String>['shoot', 'no shoot'];
TextEditingController slCont = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController quantity = TextEditingController();
TextEditingController activitytype = TextEditingController();
TextEditingController remarks = TextEditingController();
TextEditingController shootdate = TextEditingController();
ScrollController controller1 = ScrollController();
ScrollController controller2 = ScrollController();
TextEditingController searchController = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController shootdatefilter = TextEditingController();
TextEditingController slfilter = TextEditingController();
TextEditingController descriptionfilter = TextEditingController();
TextEditingController activitytypefilter = TextEditingController();
TextEditingController quantityfilter = TextEditingController();
TextEditingController remarksfilter = TextEditingController();
String slstring = "";
String shootstring = "";
String descriptionstring = "";
String activitytypestring = "";
String quantitystring = "";
String remarksstring = "";
bool isclear = true;

class _PropertyLogsState extends State<PropertyLogs> {
  late Future<Album> futureAlbum;

  // List mydata = [];

  @override
  void initState() {
    super.initState();
    // mydata = fetchData();
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
                  controller: controller1,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
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
                        //           InkWell(
                        //             onTap: () {},
                        //             child: Container(
                        //               height: 40,
                        //               width: 120,
                        //               decoration: const BoxDecoration(
                        //                 color:
                        //                     Color.fromARGB(255, 136, 108, 192),
                        //                 borderRadius: BorderRadius.only(
                        //                     topLeft: Radius.circular(18),
                        //                     bottomLeft: Radius.circular(16)),
                        //               ),
                        //               child: const Center(
                        //                 child: Text(
                        //                   'Choose file',
                        //                   style: TextStyle(
                        //                       fontSize: 16,
                        //                       color: Colors.white),
                        //                 ),
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
                        // Text(mydata.toString()),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(24),
                          // height: 694,
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
                              ///////////////////////////////////////////////////////////////////////////////////
                              const Row(
                                children: [
                                  Text(
                                    'Shoot Date',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                    validator: (value) {},
                                    fn: () {},
                                    showIcon: true,
                                    readonly: true,
                                    fieldWidth: 154,
                                    textSize: 15,
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
                                hintText: '',
                                icn: Icons.keyboard_arrow_down,
                                validator: (value) {},
                                showIcon: false,
                                readonly: false,
                                fieldWidth: 252,
                                fn: () {},
                                textSize: 15,
                                cont: slCont,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
                                      const Color.fromARGB(255, 143, 153, 205),
                                  elevation: 16,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  items: descriptionlist
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      description.text = value!;
                                    });
                                  },
                                  underline: Center(
                                    child: IgnorePointer(
                                      child: LogTextField(
                                        hintText: 'Select...',
                                        icn: Icons.keyboard_arrow_down,
                                        showIcon: true,
                                        validator: (value) {},
                                        readonly: true,
                                        fn: () {},
                                        fieldWidth: 252,
                                        textSize: 15,
                                        cont: description,
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
                                      const Color.fromARGB(255, 143, 153, 205),
                                  elevation: 16,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  items: activitytypelist
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
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
                                        icn: Icons.keyboard_arrow_down,
                                        showIcon: true,
                                        validator: (value) {},
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
                                fn: () {},
                                validator: (value) {},
                                icn: Icons.keyboard_arrow_down,
                                showIcon: false,
                                readonly: false,
                                fieldWidth: 252,
                                textSize: 15,
                                cont: remarks,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 136, 108, 192),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add Log',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     Container(
                        //       height: 40,
                        //       width: 120,
                        //       decoration: const BoxDecoration(
                        //         color: Color.fromARGB(255, 136, 108, 192),
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(12),
                        //         ),
                        //       ),
                        //       child: const Center(
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceEvenly,
                        //           children:  [
                        //             Text(
                        //               'Apply',
                        //               style: TextStyle(
                        //                   fontSize: 16,
                        //                   color: Colors.white,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //             Icon(
                        //               Icons.filter_alt_rounded,
                        //               color: Colors.white,
                        //               size: 20,
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       height: 40,
                        //       width: 128,
                        //       decoration: const BoxDecoration(
                        //         color: Color.fromARGB(255, 136, 108, 192),
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(12),
                        //         ),
                        //       ),
                        //       child: const Center(
                        //         child: Text(
                        //           'Export CSV',
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w500),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //   ],
                        // ),
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
                                title: const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Filters',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 37, 36, 36),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 0,
                                        left: 24,
                                        right: 24,
                                        bottom: 12),
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
                                            const Text('Description',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 36.w,
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    descriptionstring = value;
                                                  });
                                                },
                                                controller: descriptionfilter,
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
                                                  isclear = !isclear;
                                                  shootdatefilter.text = '';
                                                  descriptionstring = "";
                                                  descriptionfilter.text = "";
                                                  activitytypefilter.text = '';
                                                  activitytypestring = "";
                                                  quantityfilter.text = '';
                                                  quantitystring = "";
                                                  remarksfilter.text = '';
                                                  remarksstring = "";
                                                  isclear = !isclear;
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
                                                child: Center(
                                                  child: isclear
                                                      ? const Text(
                                                          'Clear All',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      : const SizedBox(
                                                          height: 20,
                                                          width: 20,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    136,
                                                                    108,
                                                                    192),
                                                          ),
                                                        ),
                                                ),
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
                                                                  "description"]
                                                              .contains(
                                                                  descriptionstring) &&
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
                                                                            .category[index]["description"],
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
                                                                            .category[index]["description"],
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 85.5.h,
              left: 30,
              child: Row(
                children: const [
                  Icon(
                    Icons.list_alt_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Property Logs',
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

  // void searchBook(String query) {
  //   final suggestions = allBooks.where((book) {
  //     final bookTitle = book.title.toLowerCase();
  //     final input = query.toLowerCase();
  //     return bookTitle.contains(input);
  //   }).toList();
  //   setState(() => books = suggestions);
  // }
}

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   String? _result;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Center(
//         child: Column(
//           children: <Widget>[
//             Text(_result ?? '', style: TextStyle(fontSize: 18)),
//             ElevatedButton(
//               onPressed: () async {
//                 var result = await showSearch<String>(
//                   context: context,
//                   delegate: CustomDelegate(),
//                 );
//                 setState(() => _result = result);
//               },
//               child: Text('Search'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomDelegate extends SearchDelegate<String> {
//   List<String> data = nouns.take(100).toList();

//   @override
//   List<Widget> buildActions(BuildContext context) =>
//       [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];

//   @override
//   Widget buildLeading(BuildContext context) => IconButton(
//       icon: const Icon(Icons.chevron_left),
//       onPressed: () => close(context, ''));

//   @override
//   Widget buildResults(BuildContext context) => Container();

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     var listToShow;
//     if (query.isNotEmpty)
//       listToShow =
//           data.where((e) => e.contains(query) && e.startsWith(query)).toList();
//     else
//       listToShow = data;

//     return ListView.builder(
//       itemCount: listToShow.length,
//       itemBuilder: (_, i) {
//         var noun = listToShow[i];
//         return ListTile(
//           title: Text(noun),
//           onTap: () => close(context, noun),
//         );
//       },
//     );
//   }
