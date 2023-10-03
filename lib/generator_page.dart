import 'package:flick_analytics/utils/log_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class GeneratorLogs extends StatefulWidget {
  const GeneratorLogs({super.key});

  @override
  State<GeneratorLogs> createState() => _GeneratorLogsState();
}

int page = 1;
bool opacity = true;
const List<String> generatortypelist = <String>['shoot', 'non-shoot'];
TextEditingController slCont = TextEditingController();
TextEditingController generatortype = TextEditingController();
TextEditingController vendorname = TextEditingController();
TextEditingController numberofhours = TextEditingController();
TextEditingController remarks = TextEditingController();
TextEditingController starttime1 = TextEditingController();
TextEditingController endtime1 = TextEditingController();
TextEditingController starttime2 = TextEditingController();
TextEditingController endtime2 = TextEditingController();
TextEditingController starttime3 = TextEditingController();
TextEditingController endtime3 = TextEditingController();
TextEditingController shootdate = TextEditingController();

class _GeneratorLogsState extends State<GeneratorLogs> {
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(100, 0, 0, 0),
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
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 136, 108, 192),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                          Container(
                                            height: 12,
                                            width: 83,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 180, 179, 181),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                          Container(
                                            height: 12,
                                            width: 83,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 180, 179, 181),
                                                borderRadius: BorderRadius.all(
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
                                            icn: Icons.calendar_month,
                                            showIcon: true,
                                            readonly: true,
                                            validator: (value) {},
                                            fieldWidth: 154,
                                            fn: () {},
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
                                        showIcon: false,
                                        readonly: false,
                                        validator: (value) {},
                                        fieldWidth: 252,
                                        textSize: 15,
                                        fn: () {},
                                        cont: slCont,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            'Generator Type',
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
                                          dropdownColor: const Color.fromARGB(
                                              255, 143, 153, 205),
                                          elevation: 8,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
                                          items: generatortypelist
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              generatortype.text = value!;
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
                                                cont: generatortype,
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
                                            'Vendor Name',
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
                                        fn: () {},
                                        fieldWidth: 252,
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
                                                        milliseconds: 300), () {
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
                                                borderRadius: BorderRadius.all(
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(100, 0, 0, 0),
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
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 136, 108, 192),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                          Container(
                                            height: 12,
                                            width: 83,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 136, 108, 192),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                          Container(
                                            height: 12,
                                            width: 83,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 156, 155, 158),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Number of Hours',
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
                                        cont: numberofhours,
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
                                        readonly: false,
                                        fieldWidth: 252,
                                        validator: (value) {},
                                        textSize: 15,
                                        cont: remarks,
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
                                                        milliseconds: 300), () {
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
                                                borderRadius: BorderRadius.all(
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
                                                        milliseconds: 300), () {
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
                                                borderRadius: BorderRadius.all(
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
                                  3) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, bottom: 24),
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
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 136, 108, 192),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                          Container(
                                            height: 12,
                                            width: 83,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 136, 108, 192),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                          Container(
                                            height: 12,
                                            width: 83,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 136, 108, 192),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Start Time 1',
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
                                                  initialTime: TimeOfDay.now());
                                          if (time != null) {
                                            String mypickedtime =
                                                '${time.hour}:${time.minute}:00';

                                            starttime1.text = DateFormat.jm()
                                                .format(DateFormat("hh:mm:ss")
                                                    .parse(mypickedtime));
                                          }
                                        },
                                        child: IgnorePointer(
                                          child: LogTextField(
                                            hintText: '--:--',
                                            icn: Icons.access_time,
                                            showIcon: true,
                                            validator: (value) {},
                                            readonly: true,
                                            fieldWidth: 154,
                                            fn: () {},
                                            textSize: 15,
                                            cont: starttime1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'End Time 1',
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
                                                  initialTime: TimeOfDay.now());
                                          if (time != null) {
                                            String mypickedtime =
                                                '${time.hour}:${time.minute}:00';

                                            endtime1.text = DateFormat.jm()
                                                .format(DateFormat("hh:mm:ss")
                                                    .parse(mypickedtime));
                                          }
                                        },
                                        child: IgnorePointer(
                                          child: LogTextField(
                                            hintText: '--:--',
                                            icn: Icons.access_time,
                                            showIcon: true,
                                            readonly: true,
                                            validator: (value) {},
                                            fn: () {},
                                            fieldWidth: 154,
                                            textSize: 15,
                                            cont: endtime1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Start Time 2',
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
                                                  initialTime: TimeOfDay.now());
                                          if (time != null) {
                                            String mypickedtime =
                                                '${time.hour}:${time.minute}:00';

                                            starttime2.text = DateFormat.jm()
                                                .format(DateFormat("hh:mm:ss")
                                                    .parse(mypickedtime));
                                          }
                                        },
                                        child: IgnorePointer(
                                          child: LogTextField(
                                            hintText: '--:--',
                                            icn: Icons.access_time,
                                            showIcon: true,
                                            validator: (value) {},
                                            readonly: true,
                                            fieldWidth: 154,
                                            fn: () {},
                                            textSize: 15,
                                            cont: starttime2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'End Time 2',
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
                                                  initialTime: TimeOfDay.now());
                                          if (time != null) {
                                            String mypickedtime =
                                                '${time.hour}:${time.minute}:00';

                                            endtime2.text = DateFormat.jm()
                                                .format(DateFormat("hh:mm:ss")
                                                    .parse(mypickedtime));
                                          }
                                        },
                                        child: IgnorePointer(
                                          child: LogTextField(
                                            hintText: '--:--',
                                            icn: Icons.access_time,
                                            showIcon: true,
                                            validator: (value) {},
                                            fn: () {},
                                            readonly: true,
                                            fieldWidth: 154,
                                            textSize: 15,
                                            cont: endtime2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Start Time 3',
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
                                                  initialTime: TimeOfDay.now());
                                          if (time != null) {
                                            String mypickedtime =
                                                '${time.hour}:${time.minute}:00';

                                            starttime3.text = DateFormat.jm()
                                                .format(DateFormat("hh:mm:ss")
                                                    .parse(mypickedtime));
                                          }
                                        },
                                        child: IgnorePointer(
                                          child: LogTextField(
                                            hintText: '--:--',
                                            validator: (value) {},
                                            icn: Icons.access_time,
                                            fn: () {},
                                            showIcon: true,
                                            readonly: true,
                                            fieldWidth: 154,
                                            textSize: 15,
                                            cont: starttime3,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'End Time 3',
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
                                                  initialTime: TimeOfDay.now());
                                          if (time != null) {
                                            String mypickedtime =
                                                '${time.hour}:${time.minute}:00';

                                            endtime3.text = DateFormat.jm()
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
                                            cont: endtime3,
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
                                                        milliseconds: 300), () {
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
                                                borderRadius: BorderRadius.all(
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
                                          Container(
                                            height: 40,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 136, 108, 192),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          )),
                        ),
                        //     const SizedBox(
                        //       height: 30,
                        //     ),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         const SizedBox(
                        //           width: 10,
                        //         ),
                        //         Container(
                        //           height: 40,
                        //           width: 120,
                        //           decoration: const BoxDecoration(
                        //             color: Color.fromARGB(255, 136, 108, 192),
                        //             borderRadius: BorderRadius.all(
                        //               Radius.circular(12),
                        //             ),
                        //           ),
                        //           child: const Center(
                        //             child: Text(
                        //               'Sync Data',
                        //               style: TextStyle(
                        //                   fontSize: 16,
                        //                   color: Colors.white,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ),
                        //         ),
                        //         Container(
                        //           height: 40,
                        //           width: 128,
                        //           decoration: const BoxDecoration(
                        //             color: Color.fromARGB(255, 136, 108, 192),
                        //             borderRadius: BorderRadius.all(
                        //               Radius.circular(12),
                        //             ),
                        //           ),
                        //           child: const Center(
                        //             child: Text(
                        //               'Export CSV',
                        //               style: TextStyle(
                        //                   fontSize: 16,
                        //                   color: Colors.white,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ),
                        //         ),
                        //         const SizedBox(
                        //           width: 10,
                        //         ),
                        //       ],
                        //     ),
                        //     const SizedBox(
                        //       height: 20,
                        //     ),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         const SizedBox(
                        //           width: 30,
                        //         ),
                        //         Container(
                        //           height: 40,
                        //           width: 136,
                        //           decoration: const BoxDecoration(
                        //             color: Color.fromARGB(255, 255, 20, 20),
                        //             borderRadius: BorderRadius.all(
                        //               Radius.circular(12),
                        //             ),
                        //           ),
                        //           child: const Center(
                        //             child: Text(
                        //               'Empty Table',
                        //               style: TextStyle(
                        //                   fontSize: 16,
                        //                   color: Colors.white,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     const SizedBox(height: 36),
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
                    'Generator Logs',
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
