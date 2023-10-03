import 'dart:convert';
import 'dart:math';
// import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flick_analytics/admin_pre_production.dart';
import 'package:flick_analytics/artistes.dart';
import 'package:flick_analytics/common_shoot.dart';
import 'package:flick_analytics/edit_budget_page.dart';
// import 'package:flick_analytics/page_one.dart';
import 'package:flick_analytics/post_production.dart';
import 'package:flick_analytics/schedule_cost.dart';
import 'package:flick_analytics/technicians.dart';
import 'package:flick_analytics/utils/data_table.dart';

// import 'package:flick_analytics/utils/splash.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:shimmer/shimmer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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

class BudgetingPage extends StatefulWidget {
  const BudgetingPage({super.key});

  @override
  State<BudgetingPage> createState() => _BudgetingPageState();
}

dynamic b;
List sum1 = List<dynamic>.generate(
    b['category']['Admin and Pre Production']['children'].length, (i) => 0);
List sum2 = List<dynamic>.generate(
    b['category']['Artistes']['children'].length, (i) => 0);
List sum3 = List<dynamic>.generate(
    b['category']['Technicians']['children'].length, (i) => 0);
List sum4 = List<dynamic>.generate(
    b['category']['Common Shoot']['children'].length, (i) => 0);
List sum5 = List<dynamic>.generate(
    b['category']['Schedule Cost']['children'].length, (i) => 0);
List sum6 = List<dynamic>.generate(
    b['category']['Post Production']['children'].length, (i) => 0);
int iv1 = 1;
int iv2 = 1;
int iv3 = 1;

var adminactualspent = List<dynamic>.generate(
    b['category']['Admin and Pre Production']['children'].length, (i) => 0);
var artistactualspent = List<dynamic>.generate(
    b['category']['Artistes']['children'].length, (i) => 0);
var technicianactualspent = List<dynamic>.generate(
    b['category']['Technicians']['children'].length, (i) => 0);
var commonshootactualspent = List<dynamic>.generate(
    b['category']['Common Shoot']['children'].length, (i) => 0);
var scheduleactualspent = List<dynamic>.generate(
    b['category']['Schedule Cost']['children'].length, (i) => 0);
var postproductionactualspent = List<dynamic>.generate(
    b['category']['Post Production']['children'].length, (i) => 0);

var mysum1 = sum1.reduce((a, b) => a + b);
var mysum2 = sum2.reduce((a, b) => a + b);
var mysum3 = sum3.reduce((a, b) => a + b);
var mysum4 = sum4.reduce((a, b) => a + b);
var mysum5 = sum5.reduce((a, b) => a + b);
var mysum6 = sum6.reduce((a, b) => a + b);

var totalshoot = 58.901;
bool ischart = true;

var adminactualspentsum = adminactualspent.reduce((a, b) => a + b);
var artistactualspentsum = artistactualspent.reduce((a, b) => a + b);
var technicianactualspentsum = technicianactualspent.reduce((a, b) => a + b);
var commonshootactualspentsum = commonshootactualspent.reduce((a, b) => a + b);
var scheduleactualspentsum = scheduleactualspent.reduce((a, b) => a + b);
var postproductionactualspentsum =
    postproductionactualspent.reduce((a, b) => a + b);

List<dynamic> allsumlist = [
  mysum1,
  mysum2,
  mysum3,
  mysum4,
  mysum5,
  mysum6,
];
List<dynamic> allactualspentlist = [
  adminactualspentsum,
  artistactualspentsum,
  technicianactualspentsum,
  commonshootactualspentsum,
  scheduleactualspentsum,
  postproductionactualspentsum
];

class _BudgetingPageState extends State<BudgetingPage> {
  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://api.flickanalytics.in/FlickReportsAPIs/fetch_categories.php'));

    b = jsonDecode(response.body);
    for (int i = 0;
        i < b['category']['Admin and Pre Production']['children'].length;
        i++) {
      sum1[i] = (num.parse(b['category']['Admin and Pre Production']['children']
          [i]['estimated_budget']));
    }
    for (int i = 0; i < b['category']['Artistes']['children'].length; i++) {
      sum2[i] = (num.parse(
          b['category']['Artistes']['children'][i]['estimated_budget']));
    }
    for (int i = 0; i < b['category']['Technicians']['children'].length; i++) {
      sum3[i] = (num.parse(
          b['category']['Technicians']['children'][i]['estimated_budget']));
    }
    for (int i = 0; i < b["category"]["Common Shoot"]["children"].length; i++) {
      sum4[i] = (num.parse(
          b['category']['Common Shoot']['children'][i]['estimated_budget']));
    }
    for (int i = 0;
        i < b['category']['Schedule Cost']['children'].length;
        i++) {
      sum5[i] = (num.parse(
          b['category']['Schedule Cost']['children'][i]['estimated_budget']));
    }
    for (int i = 0;
        i < b['category']['Post Production']['children'].length;
        i++) {
      sum6[i] = (num.parse(
          b['category']['Post Production']['children'][i]['estimated_budget']));
    }

    ////////////////////////////////////////////////////////////////
    for (int j = 0;
        j < b['category']['Admin and Pre Production']['children'].length;
        j++) {
      for (int i = 0; i < b['actual_spent'].length; i++) {
        if (b['actual_spent'][i]['category_id'] ==
            b['category']['Admin and Pre Production']['children'][j]['id']) {
          adminactualspent[j] = num.parse(b['actual_spent'][i]['total']);
        }
      }
    }
    for (int j = 0; j < b['category']['Artistes']['children'].length; j++) {
      for (int i = 0; i < b['actual_spent'].length; i++) {
        if (b['actual_spent'][i]['category_id'] ==
            b['category']['Artistes']['children'][j]['id']) {
          artistactualspent[j] = num.parse(b['actual_spent'][i]['total']);
        }
      }
    }
    for (int j = 0; j < b['category']['Technicians']['children'].length; j++) {
      for (int i = 0; i < b['actual_spent'].length; i++) {
        if (b['actual_spent'][i]['category_id'] ==
            b['category']['Technicians']['children'][j]['id']) {
          technicianactualspent[j] = num.parse(b['actual_spent'][i]['total']);
        }
      }
    }
    for (int j = 0; j < b['category']['Common Shoot']['children'].length; j++) {
      for (int i = 0; i < b['actual_spent'].length; i++) {
        if (b['actual_spent'][i]['category_id'] ==
            b['category']['Common Shoot']['children'][j]['id']) {
          commonshootactualspent[j] = num.parse(b['actual_spent'][i]['total']);
        }
      }
    }
    for (int j = 0;
        j < b['category']['Schedule Cost']['children'].length;
        j++) {
      for (int i = 0; i < b['actual_spent'].length; i++) {
        if (b['actual_spent'][i]['category_id'] ==
            b['category']['Schedule Cost']['children'][j]['id']) {
          scheduleactualspent[j] = num.parse(b['actual_spent'][i]['total']);
        }
      }
    }
    for (int j = 0;
        j < b['category']['Post Production']['children'].length;
        j++) {
      for (int i = 0; i < b['actual_spent'].length; i++) {
        if (b['actual_spent'][i]['category_id'] ==
            b['category']['Post Production']['children'][j]['id']) {
          postproductionactualspent[j] =
              num.parse(b['actual_spent'][i]['total']);
        }
      }
    }

    ////////////////////////////////////////////////////////////////////////////

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  final List<String> items = [
    'Admin and Pre Production',
    'Artistes',
    'Technicians',
    'Common Shoot Expenses',
    'Schedule Cost',
    'Post Production',
  ];

  int activesubcatval = 0;
  final List<List<String>> subcatval = [
    [
      'Office Advance',
      'Office Rent',
      'Office Boy Salary',
    ],
    [
      'Main Lead',
      'Hero 1',
      'Hero2',
    ],
    [
      'Director',
      'Co Director',
      'Associate Director',
    ],
    [
      'Hair & Makeup',
      'Costume & Jewellery',
      'Set Work',
    ],
    [
      'Shoot Batta',
      'Vehicle Cost',
      'Fuel Cost',
    ],
    [
      'Dubbing',
      'SFX & Mixing',
      'Food Expenses',
    ],
  ];

  String? selectedValue;
  TextEditingController mycont = TextEditingController();

  bool isViewBudget = true;
  String dropdownValue = 'One';
  String budgetingTitle = 'Admin and Pre Production';

  // late Future<Album> futureAlbum;

  // // List mydata = [];

  // @override
  // void initState() {
  //   super.initState();
  //   // mydata = fetchData();
  //   futureAlbum = fetchAlbum();
  // }

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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                isViewBudget = true;
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
                                  SiteLogImages(img: 'view'),
                                  Text(
                                    "View Budget",
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
                                isViewBudget = false;
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
                                  SiteLogImages(img: 'budget'),
                                  Text(
                                    'Edit Budget',
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
                      isViewBudget
                          ? Container(
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
                                    child: Row(
                                      children: [
                                        Text(
                                          'Budgets',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
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
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 30.0),
                                      child: SizedBox(
                                        width: 280,
                                        height: 40,
                                        child: Center(
                                          child: DropdownButtonHideUnderline(
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
                                                          color: Color.fromARGB(
                                                              200, 57, 57, 57),
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                items: items
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
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

                                                    budgetingTitle = value;
                                                    activesubcatval =
                                                        items.indexOf(value);
                                                  });
                                                },
                                                buttonStyleData:
                                                    ButtonStyleData(
                                                  height: 50,
                                                  width: 270,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14, right: 14),
                                                  decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Color.fromARGB(
                                                              100, 0, 0, 0),
                                                          blurRadius: 3)
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    // border: Border.all(
                                                    //   color:
                                                    //       Colors.black26,
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
                                                            const EdgeInsets.all(
                                                                8),
                                                        maxHeight: 190,
                                                        width: 265,
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
                                                                  blurRadius: 4)
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        14),
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    136,
                                                                    108,
                                                                    192),
                                                                width: 0.5)),
                                                        elevation: 8,
                                                        offset:
                                                            const Offset(-5, 0),
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
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 350, child: ChartPage()),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  budgetingTitle,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                ischart
                                                    ? InkWell(
                                                        onDoubleTap: () {
                                                          setState(() {
                                                            ischart = !ischart;
                                                          });
                                                          print(
                                                              allactualspentlist[
                                                                  1]);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              SizedBox(
                                                                  height: 120,
                                                                  width: double
                                                                      .infinity,
                                                                  child: FutureBuilder<
                                                                          Album>(
                                                                      future:
                                                                          fetchAlbum(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        if (snapshot.connectionState ==
                                                                            ConnectionState.waiting) {
                                                                          return const SizedBox(
                                                                              height: 200,
                                                                              child: Center(
                                                                                  child: CircularProgressIndicator(
                                                                                color: Color.fromARGB(255, 136, 108, 192),
                                                                                strokeWidth: 6,
                                                                              )));
                                                                        }

                                                                        return BarChartWidget(
                                                                          s1: 'Estimated',
                                                                          s2: "Actual",
                                                                          s3: "Variance",
                                                                          points: [
                                                                            ChartData(
                                                                              1,
                                                                              double.parse((allsumlist[activesubcatval]).toStringAsFixed(2)),
                                                                            ),
                                                                            ChartData(
                                                                              2,
                                                                              double.parse(allactualspentlist[activesubcatval].toStringAsFixed(2)),
                                                                            ),
                                                                            ChartData(
                                                                              3,
                                                                              double.parse(
                                                                                (allsumlist[activesubcatval] - allactualspentlist[activesubcatval]).toStringAsFixed(2),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      })),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              SizedBox(
                                                                  height: 120,
                                                                  width: double
                                                                      .infinity,
                                                                  child: FutureBuilder<
                                                                          Album>(
                                                                      future:
                                                                          fetchAlbum(),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        if (snapshot.connectionState ==
                                                                            ConnectionState.waiting) {
                                                                          return const SizedBox(
                                                                              height: 200,
                                                                              child: Center(
                                                                                  child: CircularProgressIndicator(
                                                                                color: Color.fromARGB(255, 136, 108, 192),
                                                                                strokeWidth: 6,
                                                                              )));
                                                                        }

                                                                        return BarChartWidget(
                                                                          s1: 'Shoot',
                                                                          s2: "Difference",
                                                                          s3: "Utilisation",
                                                                          points: [
                                                                            ChartData(
                                                                              1,
                                                                              double.parse((totalshoot).toStringAsFixed(2)),
                                                                            ),
                                                                            ChartData(
                                                                              2,
                                                                              double.parse(
                                                                                ((totalshoot - (allactualspentlist[activesubcatval] / allsumlist[activesubcatval] * 100)) + 0.00001).toStringAsFixed(2),
                                                                              ),
                                                                            ),
                                                                            ChartData(
                                                                              3,
                                                                              double.parse((allactualspentlist[activesubcatval] / allsumlist[activesubcatval] * 100).toStringAsFixed(2)),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      })),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : InkWell(
                                                        onDoubleTap: () {
                                                          setState(() {
                                                            ischart = !ischart;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 4),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(6),
                                                            height: 150,
                                                            width: 280,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius: BorderRadius.all(Radius.circular(18)),
                                                                    // border: Border.all(color: const Color.fromARGB(255, 136, 108, 192), width: 2),
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
                                                            child: MyDataTable(
                                                              estBud: NumberFormat.currency(
                                                                      locale:
                                                                          'en_IN',
                                                                      symbol:
                                                                          '₹',
                                                                      decimalDigits:
                                                                          2,
                                                                      customPattern:
                                                                          '₹ ##,##,###.#')
                                                                  .format(allsumlist[
                                                                      activesubcatval]),
                                                              actspt: NumberFormat.currency(
                                                                      locale:
                                                                          'en_IN',
                                                                      symbol:
                                                                          '₹',
                                                                      decimalDigits:
                                                                          2,
                                                                      customPattern:
                                                                          '₹ ##,##,###.#')
                                                                  .format(allactualspentlist[
                                                                      activesubcatval]),
                                                              variance: NumberFormat.currency(
                                                                      locale:
                                                                          'en_IN',
                                                                      symbol:
                                                                          '₹',
                                                                      decimalDigits:
                                                                          2,
                                                                      customPattern:
                                                                          '₹ ##,##,###.#')
                                                                  .format((allsumlist[
                                                                          activesubcatval] -
                                                                      allactualspentlist[
                                                                          activesubcatval])),
                                                              utilsation: NumberFormat.currency(
                                                                      decimalDigits:
                                                                          2,
                                                                      customPattern:
                                                                          '##,##,###.#%')
                                                                  .format((allactualspentlist[
                                                                          activesubcatval] /
                                                                      allsumlist[
                                                                          activesubcatval])),
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
                                                                          (allactualspentlist[activesubcatval] /
                                                                              allsumlist[activesubcatval] *
                                                                              100)) /
                                                                      100),
                                                            ),
                                                          ),
                                                        )),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 4.h,
                                                      width: 39.5.w,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromARGB(
                                                                        100,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                blurRadius: 4)
                                                          ]),
                                                      child: Center(
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (activesubcatval ==
                                                                0) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const AdminPreProduction()));
                                                            }
                                                            if (activesubcatval ==
                                                                1) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const Artistes()));
                                                            }
                                                            if (activesubcatval ==
                                                                2) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const Technicians()));
                                                            }
                                                            if (activesubcatval ==
                                                                3) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const CommonShoot()));
                                                            }
                                                            if (activesubcatval ==
                                                                4) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const ScheduleCost()));
                                                            }
                                                            if (activesubcatval ==
                                                                5) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const PostProduction()));
                                                            }
                                                          },
                                                          child: SizedBox(
                                                            width: 100,
                                                            height: 17,
                                                            child: Center(
                                                              child: Text(
                                                                subcatval[
                                                                    activesubcatval][0],
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 4.h,
                                                      width: 30.w,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromARGB(
                                                                        100,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                blurRadius: 4)
                                                          ]),
                                                      child: Center(
                                                        child: InkWell(
                                                          onTap: () {
                                                            if (activesubcatval ==
                                                                0) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const AdminPreProduction()));
                                                            }
                                                            if (activesubcatval ==
                                                                1) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const Artistes()));
                                                            }
                                                            if (activesubcatval ==
                                                                2) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const Technicians()));
                                                            }
                                                            if (activesubcatval ==
                                                                3) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const CommonShoot()));
                                                            }
                                                            if (activesubcatval ==
                                                                4) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const ScheduleCost()));
                                                            }
                                                            if (activesubcatval ==
                                                                5) {
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .rightToLeft,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      reverseDuration: const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                      child:
                                                                          const PostProduction()));
                                                            }
                                                          },
                                                          child: SizedBox(
                                                            width: 100,
                                                            height: 17,
                                                            child: Center(
                                                              child: Text(
                                                                subcatval[
                                                                    activesubcatval][1],
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (activesubcatval ==
                                                            0) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const AdminPreProduction()));
                                                        }
                                                        if (activesubcatval ==
                                                            1) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const Artistes()));
                                                        }
                                                        if (activesubcatval ==
                                                            2) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const Technicians()));
                                                        }
                                                        if (activesubcatval ==
                                                            3) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const CommonShoot()));
                                                        }
                                                        if (activesubcatval ==
                                                            4) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const ScheduleCost()));
                                                        }
                                                        if (activesubcatval ==
                                                            5) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const PostProduction()));
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 4.h,
                                                        width: 39.5.w,
                                                        decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          100,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  blurRadius: 4)
                                                            ]),
                                                        child: Center(
                                                          child: SizedBox(
                                                            width: 100,
                                                            height: 17,
                                                            child: Center(
                                                              child: Text(
                                                                subcatval[
                                                                    activesubcatval][2],
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        if (activesubcatval ==
                                                            0) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const AdminPreProduction()));
                                                        }
                                                        if (activesubcatval ==
                                                            1) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const Artistes()));
                                                        }
                                                        if (activesubcatval ==
                                                            2) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const Technicians()));
                                                        }
                                                        if (activesubcatval ==
                                                            3) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const CommonShoot()));
                                                        }
                                                        if (activesubcatval ==
                                                            4) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const ScheduleCost()));
                                                        }
                                                        if (activesubcatval ==
                                                            5) {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          250),
                                                                  reverseDuration:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              250),
                                                                  child:
                                                                      const PostProduction()));
                                                        }
                                                      },
                                                      child: GradientText(
                                                        'See all',
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.black),
                                                        colors: const [
                                                          Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          Color.fromARGB(
                                                              255, 0, 0, 0),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ))
                          : const EditBudgetPage(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 84.h,
              left: 30,
              child: const Text(
                '₹  Budgeting',
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

class BarGraph extends StatelessWidget {
  final double barValaue1;
  final double barValaue2;
  final double barValaue3;
  const BarGraph(
      {super.key,
      required this.barValaue1,
      required this.barValaue2,
      required this.barValaue3});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, barValaue1),
      ChartData(2, barValaue2),
      ChartData(3, barValaue3),
    ];
    return Center(
        child: SfCartesianChart(series: <ChartSeries>[
      ColumnSeries<ChartData, double>(
          dataSource: chartData,
          // Renders the track
          isTrackVisible: true,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y)
    ]));
  }
}

class ChartData {
  final double x;
  final double y;
  ChartData(this.x, this.y);
}

class BarChartWidget extends StatelessWidget {
  final String s1;
  final String s2;
  final String s3;
  const BarChartWidget(
      {Key? key,
      required this.points,
      required this.s1,
      required this.s2,
      required this.s3})
      : super(key: key);

  final List<ChartData> points;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _chartGroups(),
        borderData: FlBorderData(
            border: const Border(
                bottom: BorderSide(
                  width: 1,
                ),
                left: BorderSide(width: 1))),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              String text = '';

              return Text(value.toString().substring(0, 2));
            },
          )),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                  toY: point.y,
                  width: 40,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3)))
            ]))
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = s1;
              break;
            case 2:
              text = s2;
              break;
            case 3:
              text = s3;
              break;
          }

          return Text(text);
        },
      );
}


  // return PieChart(
                                                                        //   PieChartData(
                                                                        //       centerSpaceRadius: 40,
                                                                        //       sectionsSpace: 5,
                                                                        //       startDegreeOffset: 40,
                                                                        //       centerSpaceColor: Colors.white,
                                                                        //       borderData: FlBorderData(
                                                                        //         show: false,
                                                                        //       ),
                                                                        //       sections: [
                                                                        //         PieChartSectionData(showTitle: false, value: double.parse(totalshoot.toString()), color: const Color.fromARGB(255, 72, 61, 95)),
                                                                        //         PieChartSectionData(showTitle: false, value: double.parse((allactualspentlist[activesubcatval] / allsumlist[activesubcatval]).toString()), color: const Color.fromARGB(255, 136, 108, 192)),
                                                                        //         PieChartSectionData(
                                                                        //             showTitle: false,
                                                                        //             value: double.parse(
                                                                        //               (totalshoot - (allactualspentlist[activesubcatval] / allsumlist[activesubcatval] * 100)).toString(),
                                                                        //             ),
                                                                        //             color: const Color.fromARGB(255, 4, 30, 68)),
                                                                        //       ]),
                                                                        // );
                                                                        // return BarGraph(
                                                                        //   barValaue1:
                                                                        //       double.parse(totalshoot.toString()),
                                                                        //   barValaue2:
                                                                        //       double.parse((allactualspentlist[activesubcatval] / allsumlist[activesubcatval]).toString()),
                                                                        //   barValaue3:
                                                                        //       double.parse(
                                                                        //     (totalshoot - (allactualspentlist[activesubcatval] / allsumlist[activesubcatval] * 100)).toString(),
                                                                        //   ),
                                                                        // );