import 'dart:convert';
import 'dart:math';
// import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:flick_analytics/edit_budget_page.dart';
// import 'package:flick_analytics/page_one.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'utils/data_table.dart';
// import 'utils/text_field_util.dart';
import 'package:http/http.dart' as http;

class Album {
  final dynamic category;

  const Album({
    required this.category,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      category: json['category'],
    );
  }
}

class CommonShoot extends StatefulWidget {
  const CommonShoot({super.key});

  @override
  State<CommonShoot> createState() => _CommonShootState();
}

dynamic b;
// List sum1 = List<dynamic>.generate(
//     b['category']['Admin and Pre Production']['children'].length, (i) => 0);
// List sum2 = List<dynamic>.generate(
//     b['category']['Artistes']['children'].length, (i) => 0);
// List sum3 = List<dynamic>.generate(
//     b['category']['Technicians']['children'].length, (i) => 0);
List sum4 = List<dynamic>.generate(
    b['category']['Common Shoot']['children'].length, (i) => 0);
// List sum5 = List<dynamic>.generate(
//     b['category']['Schedule Cost']['children'].length, (i) => 0);
// List sum6 = List<dynamic>.generate(
//     b['category']['Post Production']['children'].length, (i) => 0);

List sum7 = List<dynamic>.generate(
    b['category']['Common Shoot']['children'].length, (i) => 0);

int iv1 = 1;
int iv2 = 1;
int iv3 = 1;
List sub = [];

// var adminactualspent = List<dynamic>.generate(
//     b['category']['Admin and Pre Production']['children'].length, (i) => 0);
// var artistactualspent = List<dynamic>.generate(
//     b['category']['Artistes']['children'].length, (i) => 0);
// var technicianactualspent = List<dynamic>.generate(
//     b['category']['Technicians']['children'].length, (i) => 0);
var commonshootactualspent = List<dynamic>.generate(
    b['category']['Common Shoot']['children'].length, (i) => 0);
// var scheduleactualspent = List<dynamic>.generate(
//     b['category']['Schedule Cost']['children'].length, (i) => 0);
// var postproductionactualspent = List<dynamic>.generate(
//     b['category']['Post Production']['children'].length, (i) => 0);

// var mysum1 = sum1.reduce((a, b) => a + b);
// var mysum2 = sum2.reduce((a, b) => a + b);
// var mysum3 = sum3.reduce((a, b) => a + b);
var mysum4 = sum4.reduce((a, b) => a + b);
// var mysum5 = sum5.reduce((a, b) => a + b);
// var mysum6 = sum6.reduce((a, b) => a + b);

var totalshoot = 58.90;

// var adminactualspentsum = adminactualspent.reduce((a, b) => a + b);
// var artistactualspentsum = artistactualspent.reduce((a, b) => a + b);
// var technicianactualspentsum = technicianactualspent.reduce((a, b) => a + b);
var commonshootactualspentsum = commonshootactualspent.reduce((a, b) => a + b);
// var scheduleactualspentsum = scheduleactualspent.reduce((a, b) => a + b);
// var postproductionactualspentsum =
//     postproductionactualspent.reduce((a, b) => a + b);

class _CommonShootState extends State<CommonShoot> {
  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://api.flickanalytics.in/FlickReportsAPIs/fetch_categories.php'));

    b = jsonDecode(response.body);
    // for (int i = 0;
    //     i < b['category']['Admin and Pre Production']['children'].length;
    //     i++) {
    //   sum1[i] = (num.parse(b['category']['Admin and Pre Production']['children']
    //       [i]['estimated_budget']));
    // }
    // for (int i = 0; i < b['category']['Artistes']['children'].length; i++) {
    //   sum2[i] = (num.parse(
    //       b['category']['Artistes']['children'][i]['estimated_budget']));
    // }
    // for (int i = 0; i < b['category']['Technicians']['children'].length; i++) {
    //   sum3[i] = (num.parse(
    //       b['category']['Technicians']['children'][i]['estimated_budget']));
    // }
    for (int i = 0; i < b['category']['Common Shoot']['children'].length; i++) {
      sum4[i] = (num.parse(
          b['category']['Common Shoot']['children'][i]['estimated_budget']));
      sum7[i] = ((b['category']['Common Shoot']['children'][i]['text']));
    }
    // for (int i = 0;
    //     i < b['category']['Schedule Cost']['children'].length;
    //     i++) {
    //   sum5[i] = (num.parse(
    //       b['category']['Schedule Cost']['children'][i]['estimated_budget']));
    // }
    // for (int i = 0;
    //     i < b['category']['Post Production']['children'].length;
    //     i++) {
    //   sum6[i] = (num.parse(
    //       b['category']['Post Production']['children'][i]['estimated_budget']));
    // }

    ////////////////////////////////////////////////////////////////
    // for (int j = 0;
    //     j < b['category']['Admin and Pre Production']['children'].length;
    //     j++) {
    //   for (int i = 0; i < b['actual_spent'].length; i++) {
    //     if (b['actual_spent'][i]['category_id'] ==
    //         b['category']['Admin and Pre Production']['children'][j]['id']) {
    //       adminactualspent[j] = num.parse(b['actual_spent'][i]['total']);
    //     }
    //   }
    // }
    // for (int j = 0; j < b['category']['Artistes']['children'].length; j++) {
    //   for (int i = 0; i < b['actual_spent'].length; i++) {
    //     if (b['actual_spent'][i]['category_id'] ==
    //         b['category']['Artistes']['children'][j]['id']) {
    //       artistactualspent[j] = num.parse(b['actual_spent'][i]['total']);
    //     }
    //   }
    // }
    // for (int j = 0; j < b['category']['Technicians']['children'].length; j++) {
    //   for (int i = 0; i < b['actual_spent'].length; i++) {
    //     if (b['actual_spent'][i]['category_id'] ==
    //         b['category']['Technicians']['children'][j]['id']) {
    //       technicianactualspent[j] = num.parse(b['actual_spent'][i]['total']);
    //     }
    //   }
    // }
    for (int j = 0; j < b['category']['Common Shoot']['children'].length; j++) {
      for (int i = 0; i < b['actual_spent'].length; i++) {
        if (b['actual_spent'][i]['category_id'] ==
            b['category']['Common Shoot']['children'][j]['id']) {
          commonshootactualspent[j] = num.parse(b['actual_spent'][i]['total']);
        }
      }
    }
    // for (int j = 0;
    //     j < b['category']['Schedule Cost']['children'].length;
    //     j++) {
    //   for (int i = 0; i < b['actual_spent'].length; i++) {
    //     if (b['actual_spent'][i]['category_id'] ==
    //         b['category']['Schedule Cost']['children'][j]['id']) {
    //       scheduleactualspent[j] = num.parse(b['actual_spent'][i]['total']);
    //     }
    //   }
    // }
    // for (int j = 0;
    //     j < b['category']['Post Production']['children'].length;
    //     j++) {
    //   for (int i = 0; i < b['actual_spent'].length; i++) {
    //     if (b['actual_spent'][i]['category_id'] ==
    //         b['category']['Post Production']['children'][j]['id']) {
    //       postproductionactualspent[j] =
    //           num.parse(b['actual_spent'][i]['total']);
    //     }
    //   }
    // }

    ////////////////////////////////////////////////////////////////////////////

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  final List<dynamic> items = [];

  String? selectedValue;
  TextEditingController mycont = TextEditingController();

  bool isViewBudget = true;
  String dropdownValue = 'One';

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
                height: 79.4.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
                      const SizedBox(height: 36),
                      Container(
                          padding: const EdgeInsets.all(12),
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
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Budgets',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Category :',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 30),
                                  child: SizedBox(
                                    width: 280,
                                    height: 40,
                                    child: Center(
                                      child: FutureBuilder<Album>(
                                          future: fetchAlbum(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const SizedBox(
                                                  height: 200,
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    color: Color.fromARGB(
                                                        255, 136, 108, 192),
                                                    strokeWidth: 6,
                                                  )));
                                            }
                                            return DropdownButtonHideUnderline(
                                              child: Center(
                                                child: DropdownButton2(
                                                  isExpanded: true,
                                                  hint: const Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Select Item',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromARGB(
                                                                    200,
                                                                    57,
                                                                    57,
                                                                    57),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: sum7
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item,
                                                            child: Text(
                                                              item.toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color
                                                                    .fromARGB(
                                                                        200,
                                                                        57,
                                                                        57,
                                                                        57),
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: selectedValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedValue =
                                                          value as String;

                                                      iv1 = iv2 = iv3 =
                                                          sum7.indexOf(value);
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 270,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            right: 14),
                                                    decoration: BoxDecoration(
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    100,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            blurRadius: 4)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      // border: Border.all(
                                                      //   color: Colors
                                                      //       .black26,
                                                      // ),
                                                      color: Colors.white,
                                                    ),
                                                    elevation: 2,
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                    ),
                                                    iconSize: 30,
                                                    iconEnabledColor:
                                                        Color.fromARGB(
                                                            255, 115, 123, 139),
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                          isOverButton: true,
                                                          scrollPadding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          maxHeight: 67.w,
                                                          width: 76.w,
                                                          padding: null,
                                                          decoration: BoxDecoration(
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            100,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    blurRadius:
                                                                        4)
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14),
                                                              color: Colors
                                                                  .white,
                                                              border: Border.all(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      136,
                                                                      108,
                                                                      192),
                                                                  width: 0.5)),
                                                          elevation: 8,
                                                          offset: const Offset(
                                                              -3, 0),
                                                          scrollbarTheme:
                                                              ScrollbarThemeData(
                                                            radius: const Radius
                                                                .circular(40),
                                                            thickness:
                                                                MaterialStateProperty
                                                                    .all(6),
                                                            thumbVisibility:
                                                                MaterialStateProperty
                                                                    .all(true),
                                                          )),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 14, right: 14),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, right: 4),
                                              child: SizedBox(
                                                  height: 21.h,
                                                  width: double.infinity,
                                                  child:
                                                      ///////////////////////////////////////////////////////////////////
                                                      FutureBuilder<Album>(
                                                          future: fetchAlbum(),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return const SizedBox(
                                                                  height: 200,
                                                                  child: Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            136,
                                                                            108,
                                                                            192),
                                                                    strokeWidth:
                                                                        6,
                                                                  )));
                                                            }

                                                            return Center(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                // height: 150,
                                                                // width: 280,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius: BorderRadius.all(Radius.circular(18)),
                                                                        // border: Border.all(color: const Color.fromARGB(255, 136, 108, 192), width: 2),
                                                                        boxShadow: [
                                                                      BoxShadow(
                                                                          color: Color.fromARGB(
                                                                              100,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          blurRadius:
                                                                              4)
                                                                    ]),
                                                                child:
                                                                    MyDataTable(
                                                                  estBud: NumberFormat.currency(
                                                                          locale:
                                                                              'en_IN',
                                                                          symbol:
                                                                              '₹',
                                                                          decimalDigits:
                                                                              2,
                                                                          customPattern:
                                                                              '₹ ##,##,###.#')
                                                                      .format(num
                                                                          .parse(
                                                                    snapshot.data!.category['Common Shoot']['children']
                                                                            [
                                                                            iv1]
                                                                        [
                                                                        'estimated_budget'],
                                                                  )),
                                                                  actspt: NumberFormat.currency(
                                                                          locale:
                                                                              'en_IN',
                                                                          symbol:
                                                                              '₹',
                                                                          decimalDigits:
                                                                              2,
                                                                          customPattern:
                                                                              '₹ ##,##,###.#')
                                                                      .format(commonshootactualspent[
                                                                          iv1]),
                                                                  variance: NumberFormat.currency(
                                                                          locale:
                                                                              'en_IN',
                                                                          symbol:
                                                                              '₹',
                                                                          decimalDigits:
                                                                              2,
                                                                          customPattern:
                                                                              '₹ ##,##,###.#')
                                                                      .format(num.parse((snapshot.data!.category['Common Shoot']['children'][iv1]
                                                                              [
                                                                              'estimated_budget'])) -
                                                                          commonshootactualspent[
                                                                              iv1]),
                                                                  utilsation: NumberFormat.currency(
                                                                          decimalDigits:
                                                                              2,
                                                                          customPattern:
                                                                              '##,##,###.#%')
                                                                      .format((commonshootactualspent[iv1] /
                                                                              num.parse((snapshot.data!.category['Common Shoot']['children'][iv1]['estimated_budget'])) *
                                                                              100) /
                                                                          100),
                                                                  shoot: NumberFormat.currency(
                                                                          decimalDigits:
                                                                              2,
                                                                          customPattern:
                                                                              '##,##,###.#%')
                                                                      .format(
                                                                          totalshoot /
                                                                              100),
                                                                  difference: NumberFormat.currency(
                                                                          decimalDigits:
                                                                              2,
                                                                          customPattern:
                                                                              '##,##,###.#%')
                                                                      .format((totalshoot -
                                                                              (commonshootactualspent[iv1] / num.parse((snapshot.data!.category['Common Shoot']['children'][iv1]['estimated_budget'])) * 100)) /
                                                                          100),
                                                                ),
                                                              ),
                                                            );
                                                          })),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 136, 108, 192),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                36)),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'Invoice',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 85.5.h,
              left: 30,
              child: const Text(
                '₹  Budgeting',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 80.5.h,
              left: 30,
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 110,
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
                        'View Budget',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 130,
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
                          'Commo shoot..',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
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
}

class ChartPage extends StatelessWidget {
  ChartPage({Key? key}) : super(key: key);

  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            topTitles: AxisTitles(drawBehindEverything: false),
            rightTitles: AxisTitles(drawBehindEverything: false),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: dummyData1,
              isCurved: false,
              dotData: FlDotData(show: false),
              barWidth: 2,
              color: Colors.indigo,
            ),
            LineChartBarData(
              spots: dummyData2,
              isCurved: false,
              dotData: FlDotData(show: false),
              barWidth: 2,
              color: Colors.red,
            ),
            LineChartBarData(
              spots: dummyData3,
              isCurved: false,
              dotData: FlDotData(show: false),
              barWidth: 2,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
