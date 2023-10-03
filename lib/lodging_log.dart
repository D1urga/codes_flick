import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'utils/log_text_field.dart';

class LodgingLog extends StatefulWidget {
  const LodgingLog({super.key});

  @override
  State<LodgingLog> createState() => _LodgingLogState();
}

bool opacity = true;
const List<String> roomtypelist = <String>['shoot', 'non-shoot'];
const List<String> departmentlist = <String>['shoot', 'non-shoot'];
TextEditingController shootdate = TextEditingController();
TextEditingController slCont = TextEditingController();
TextEditingController invoicenumber = TextEditingController();
TextEditingController roomtype = TextEditingController();
TextEditingController roomnumber = TextEditingController();
TextEditingController names = TextEditingController();
TextEditingController department = TextEditingController();
TextEditingController paymentname = TextEditingController();
TextEditingController details = TextEditingController();
TextEditingController nos = TextEditingController();
TextEditingController rateperhead = TextEditingController();
TextEditingController amount = TextEditingController();
TextEditingController total = TextEditingController();
TextEditingController checkin = TextEditingController();
TextEditingController checkout = TextEditingController();
int page = 1;

class _LodgingLogState extends State<LodgingLog> {
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
                height: 84.5.h,
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
                                              color:
                                                  Color.fromARGB(100, 0, 0, 0),
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
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 180, 179, 181),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 180, 179, 181),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 180, 179, 181),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
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
                                              fn: () {},
                                              icn: Icons.calendar_month,
                                              validator: (value) {},
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
                                              'Invoice Number',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                                          validator: (value) {},
                                          readonly: false,
                                          fieldWidth: 252,
                                          fn: () {},
                                          textSize: 15,
                                          cont: invoicenumber,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Room Type',
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
                                            dropdownColor: const Color.fromARGB(
                                                255, 143, 153, 205),
                                            elevation: 8,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(25)),
                                            items: roomtypelist
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                roomtype.text = value!;
                                              });
                                            },
                                            underline: Center(
                                              child: IgnorePointer(
                                                child: LogTextField(
                                                  hintText: 'Select...',
                                                  icn:
                                                      Icons.keyboard_arrow_down,
                                                  showIcon: true,
                                                  validator: (value) {},
                                                  readonly: true,
                                                  fn: () {},
                                                  fieldWidth: 252,
                                                  textSize: 15,
                                                  cont: roomtype,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              'Room Number',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                                          validator: (value) {},
                                          readonly: false,
                                          fieldWidth: 252,
                                          fn: () {},
                                          textSize: 15,
                                          cont: roomnumber,
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
                                                          milliseconds: 300),
                                                      () {
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
                                                decoration: const BoxDecoration(
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
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                if (page ==
                                    2) ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
                                              color:
                                                  Color.fromARGB(100, 0, 0, 0),
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
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 180, 179, 181),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 180, 179, 181),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              'Names',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                                          validator: (value) {},
                                          fn: () {},
                                          fieldWidth: 252,
                                          textSize: 15,
                                          cont: names,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              'Department',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                                            dropdownColor: const Color.fromARGB(
                                                255, 143, 153, 205),
                                            elevation: 8,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(25)),
                                            items: departmentlist
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                department.text = value!;
                                              });
                                            },
                                            underline: Center(
                                              child: IgnorePointer(
                                                child: LogTextField(
                                                  hintText: 'Select...',
                                                  icn:
                                                      Icons.keyboard_arrow_down,
                                                  showIcon: true,
                                                  validator: (value) {},
                                                  readonly: true,
                                                  fn: () {},
                                                  fieldWidth: 252,
                                                  textSize: 15,
                                                  cont: department,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              'Payment Name',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                                          fn: () {},
                                          showIcon: false,
                                          readonly: false,
                                          validator: (value) {},
                                          fieldWidth: 252,
                                          textSize: 15,
                                          cont: paymentname,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Details',
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
                                          fn: () {},
                                          validator: (value) {},
                                          showIcon: false,
                                          readonly: false,
                                          fieldWidth: 252,
                                          textSize: 15,
                                          cont: details,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  opacity = false;
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 300),
                                                      () {
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
                                                decoration: const BoxDecoration(
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
                                                        color: Color.fromARGB(
                                                            255, 136, 108, 192),
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                                          milliseconds: 300),
                                                      () {
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
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(12),
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Next',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                if (page ==
                                    3) //////////////////////////////////////////////////////////////////////////////////
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
                                              color:
                                                  Color.fromARGB(100, 0, 0, 0),
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
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 180, 179, 181),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          'Nos',
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
                                          fn: () {},
                                          showIcon: false,
                                          validator: (value) {},
                                          readonly: false,
                                          fieldWidth: 252,
                                          textSize: 15,
                                          cont: nos,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Rate Per Head',
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
                                          validator: (value) {},
                                          readonly: false,
                                          fieldWidth: 252,
                                          fn: () {},
                                          textSize: 15,
                                          cont: rateperhead,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Amount',
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
                                          fn: () {},
                                          showIcon: false,
                                          readonly: false,
                                          validator: (value) {},
                                          fieldWidth: 252,
                                          textSize: 15,
                                          cont: amount,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Total',
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
                                          validator: (value) {},
                                          fieldWidth: 252,
                                          textSize: 15,
                                          cont: total,
                                          fn: () {},
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  opacity = false;
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 300),
                                                      () {
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
                                                decoration: const BoxDecoration(
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
                                                        color: Color.fromARGB(
                                                            255, 136, 108, 192),
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                                          milliseconds: 300),
                                                      () {
                                                    setState(() {
                                                      opacity = true;
                                                      page = 4;
                                                    });
                                                  });
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 90,
                                                decoration: const BoxDecoration(
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
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                if (page ==
                                    4) ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
                                              color:
                                                  Color.fromARGB(100, 0, 0, 0),
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
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                            Container(
                                              height: 12,
                                              width: 62,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 136, 108, 192),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          'Check In',
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

                                              checkin.text = DateFormat.jm()
                                                  .format(DateFormat("hh:mm:ss")
                                                      .parse(mypickedtime));
                                            }
                                          },
                                          child: IgnorePointer(
                                            child: LogTextField(
                                              hintText: '--:--',
                                              icn: Icons.access_time,
                                              fn: () {},
                                              showIcon: true,
                                              validator: (value) {},
                                              readonly: true,
                                              fieldWidth: 154,
                                              textSize: 15,
                                              cont: checkin,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Check Out',
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

                                              checkout.text = DateFormat.jm()
                                                  .format(DateFormat("hh:mm:ss")
                                                      .parse(mypickedtime));
                                            }
                                          },
                                          child: IgnorePointer(
                                            child: LogTextField(
                                              hintText: '--:--',
                                              icn: Icons.access_time,
                                              validator: (value) {},
                                              showIcon: true,
                                              readonly: true,
                                              fieldWidth: 154,
                                              textSize: 15,
                                              fn: () {},
                                              cont: checkout,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  opacity = false;
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 300),
                                                      () {
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
                                                decoration: const BoxDecoration(
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
                                                        color: Color.fromARGB(
                                                            255, 136, 108, 192),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 40,
                                                width: 90,
                                                decoration: const BoxDecoration(
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
                                                            FontWeight.w500),
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
                            ))),
                        // const SizedBox(
                        //   height: 30,
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
                        //         child: Text(
                        //           'Sync Data',
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w500),
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
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     const SizedBox(
                        //       width: 30,
                        //     ),
                        //     Container(
                        //       height: 40,
                        //       width: 136,
                        //       decoration: const BoxDecoration(
                        //         color: Color.fromARGB(255, 255, 20, 20),
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(12),
                        //         ),
                        //       ),
                        //       child: const Center(
                        //         child: Text(
                        //           'Empty Table',
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w500),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 36),
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
                    'logding Logs',
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
}
