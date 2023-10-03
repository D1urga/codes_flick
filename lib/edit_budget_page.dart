import 'package:flick_analytics/utils/text_field_util.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditBudgetPage extends StatefulWidget {
  const EditBudgetPage({super.key});

  @override
  State<EditBudgetPage> createState() => _EditBudgetPageState();
}

List optionList = [true, false, false];
TextEditingController cont1 = TextEditingController();
bool ifTrue = true;

class _EditBudgetPageState extends State<EditBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      // height: 750,
      width: 84.w,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(100, 0, 0, 0), blurRadius: 4)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    optionList[0] = true;
                    optionList[1] = false;
                    optionList[2] = false;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4, left: 4, right: 4, bottom: 0),
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 25,
                      color: optionList[0]
                          ? const Color.fromARGB(255, 136, 108, 192)
                          : const Color.fromARGB(255, 115, 123, 139),
                    )),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    optionList[0] = false;
                    optionList[1] = true;
                    optionList[2] = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4, left: 4, right: 4, bottom: 0),
                  child: Icon(
                    Icons.edit_calendar,
                    size: 25,
                    color: optionList[1]
                        ? const Color.fromARGB(255, 136, 108, 192)
                        : const Color.fromARGB(255, 115, 123, 139),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    optionList[0] = false;
                    optionList[1] = false;
                    optionList[2] = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4, left: 4, right: 4, bottom: 0),
                  child: Icon(
                    Icons.delete,
                    size: 25,
                    color: optionList[2]
                        ? const Color.fromARGB(255, 136, 108, 192)
                        : const Color.fromARGB(255, 115, 123, 139),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Divider(
                  color: optionList[0]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 222, 226, 230),
                  thickness: 2,
                  indent: 10,
                  endIndent: 2,
                ),
              ),
              Expanded(
                child: Divider(
                  color: optionList[1]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 222, 226, 230),
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
              ),
              Expanded(
                child: Divider(
                  color: optionList[2]
                      ? const Color.fromARGB(255, 136, 108, 192)
                      : const Color.fromARGB(255, 222, 226, 230),
                  thickness: 2,
                  endIndent: 10,
                  indent: 2,
                ),
              ),
            ],
          ),
          // isMovieDetail
          //     ? const MovieDetails()
          //     : EditMovieDetails(
          //         ct1: ct1, ct2: ct2, ct3: ct3, ct4: ct4, ct5: ct5, ct6: ct6)
          AnimatedSwitcher(
            duration: Duration(seconds: 2),
            child: Column(
              children: [
                if (optionList[0] == true)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Parent Category :',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(200, 57, 57, 57),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldUtil(
                          hintText: '',
                          color: const Color.fromARGB(255, 115, 123, 139),
                          showIcon: true,
                          readonly: true,
                          maxline: 1,
                          borderradius: 12,
                          fieldWidth: 300,
                          textSize: 14,
                          conPadding: 10,
                          borderwidth: 1,
                          cont: cont1,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Category Name :',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(200, 57, 57, 57),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldUtil(
                          hintText: '',
                          color: const Color.fromARGB(255, 115, 123, 139),
                          showIcon: false,
                          readonly: true,
                          maxline: 1,
                          borderradius: 12,
                          fieldWidth: 300,
                          textSize: 14,
                          conPadding: 15,
                          borderwidth: 1,
                          cont: cont1,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Estimated Budget :',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(200, 57, 57, 57),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldUtil(
                          hintText: '',
                          color: const Color.fromARGB(255, 115, 123, 139),
                          showIcon: false,
                          readonly: true,
                          maxline: 1,
                          borderradius: 12,
                          fieldWidth: 300,
                          textSize: 14,
                          conPadding: 15,
                          borderwidth: 1,
                          cont: cont1,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 136,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 136, 108, 192),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Text(
                                'Add Category',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                if (optionList[1] == true)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ifTrue
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Category Name :',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(200, 57, 57, 57),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFieldUtil(
                                    hintText: '',
                                    color: const Color.fromARGB(
                                        255, 115, 123, 139),
                                    showIcon: true,
                                    readonly: true,
                                    maxline: 1,
                                    borderradius: 12,
                                    fieldWidth: 300,
                                    textSize: 14,
                                    conPadding: 10,
                                    borderwidth: 1,
                                    cont: cont1,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  const Text(
                                    'Estimated Budget :',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(200, 57, 57, 57),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFieldUtil(
                                    hintText: '',
                                    color: const Color.fromARGB(
                                        255, 115, 123, 139),
                                    showIcon: false,
                                    readonly: true,
                                    maxline: 1,
                                    borderradius: 12,
                                    fieldWidth: 300,
                                    textSize: 14,
                                    conPadding: 15,
                                    borderwidth: 1,
                                    cont: cont1,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Category Name :',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(200, 57, 57, 57),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFieldUtil(
                                    hintText: '',
                                    color: const Color.fromARGB(
                                        255, 115, 123, 139),
                                    showIcon: true,
                                    readonly: true,
                                    maxline: 1,
                                    borderradius: 12,
                                    fieldWidth: 300,
                                    textSize: 14,
                                    conPadding: 10,
                                    borderwidth: 1,
                                    cont: cont1,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  const Text(
                                    'Parent Category Name :',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(200, 57, 57, 57),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFieldUtil(
                                    hintText: '',
                                    color: const Color.fromARGB(
                                        255, 115, 123, 139),
                                    showIcon: true,
                                    readonly: true,
                                    maxline: 1,
                                    borderradius: 12,
                                    fieldWidth: 300,
                                    textSize: 14,
                                    conPadding: 15,
                                    borderwidth: 1,
                                    cont: cont1,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                ],
                              ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ifTrue = true;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 124,
                                decoration: BoxDecoration(
                                  color: ifTrue
                                      ? const Color.fromARGB(255, 136, 108, 192)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit Budget',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ifTrue
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 136, 108, 192),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ifTrue = false;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 124,
                                decoration: BoxDecoration(
                                  color: !ifTrue
                                      ? const Color.fromARGB(255, 136, 108, 192)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit Parent',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: !ifTrue
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 136, 108, 192),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                if (optionList[2] == true)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Category Name :',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(200, 57, 57, 57),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFieldUtil(
                          hintText: '',
                          color: const Color.fromARGB(255, 115, 123, 139),
                          showIcon: true,
                          readonly: true,
                          maxline: 1,
                          borderradius: 12,
                          fieldWidth: 300,
                          textSize: 14,
                          conPadding: 10,
                          borderwidth: 1,
                          cont: cont1,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 136,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 136, 108, 192),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Text(
                                'Delete Category',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
