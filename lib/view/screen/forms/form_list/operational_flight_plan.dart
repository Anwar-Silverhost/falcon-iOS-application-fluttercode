import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_font.dart';
import '../../../../utils/app_sp.dart';
import '../../profile/profile_screen.dart';

class OperationalFlightPlan extends StatefulWidget {
  const OperationalFlightPlan({super.key});

  @override
  State<OperationalFlightPlan> createState() => _OperationalFlightPlanState();
}

class _OperationalFlightPlanState extends State<OperationalFlightPlan> {
  bool _isCheckedx = false;

  String userToken = '';
  String fullName = '';
  String selectedGroupName = '';
  List<dynamic> apps = [];
  String profilePic = '';
  String UserID = '';
  String selectedGroupId_id = '';

  String selectMaingroup = '';

  var profile = dummyProfile;

  @override
  void initState() {
    super.initState();
    getUserToken();
  }

  Future<void> getUserToken() async {
    AppSp appSp = AppSp();
    userToken = await appSp.getToken();
    fullName = await appSp.getFullname();
    selectedGroupName = await appSp.getSelectedgroup();
    UserID = await appSp.getUserID();
    profile = await appSp.getUserprofilepic();
    selectedGroupId_id = await appSp.getSelectedgroupID();

    selectMaingroup = await appSp.getSelected_Maingroup();

    setState(() {
      selectedGroupId_id = selectedGroupId_id;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FB),
      extendBody: true,
      body: Stack(
        children: [
          Image.asset(
            WhiteBackground,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1200.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5.0),
                  Container(
                    padding: const EdgeInsets.all(35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo
                        Image.asset(
                          RedBlackLogo,
                          height: 90.0,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  fullName,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: AppFont.OutfitFont,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  selectedGroupName,
                                  style: TextStyle(
                                    color: const Color(0xFF969492),
                                    fontSize: 14,
                                    fontFamily: AppFont.OutfitFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10.0),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => ProfileScreen(),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundImage: FileImage(File(profile)),
                                radius: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Card(
                                    color: AppColor.primaryColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                "/forms",
                                              );
                                            },
                                            child: const Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'OPERATIONAL FLIGHT PLAN/ COMMERCIAL\nFLIGHT REPORT (CFR)'
                                                .toUpperCase(),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Top: Text field
                                      Container(
                                        width: double.infinity,
                                        height: 40,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: 'CFR No.',
                                            hintStyle: const TextStyle(
                                                color: Color(0xFFCACAC9)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFCACAC9)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF626262)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFCACAC9)),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8, horizontal: 8),
                                          ),
                                        ),
                                      ),

                                      // Space between fields
                                      const SizedBox(height: 5),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            color: AppColor.primaryColor,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            '12/10/2012'.toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: AppFont.OutfitFont,
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Card(
                              color: AppColor.primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Space between icon and text
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, // Vertically centers icon and text
                                  children: [
                                    Expanded(
                                      // Ensures the text stays centered
                                      child: Text(
                                        'FLIGHT PLAN '.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: SingleChildScrollView(
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.all(5),
                                      child: Table(
                                        border: TableBorder.all(
                                            color: Colors.black26),
                                        columnWidths: const {
                                          0: FixedColumnWidth(180.0),
                                          1: FixedColumnWidth(140.0),
                                          2: FixedColumnWidth(120.0),
                                        },
                                        children: [
                                          TableRow(children: [
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'HELICOPTER TYPE'.toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFont.OutfitFont,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'Helicopter REG'.toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFont.OutfitFont,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'Flight #'.toUpperCase(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppFont.OutfitFont,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: Container(
                                                constraints:
                                                    const BoxConstraints(
                                                  minHeight: 10.0,
                                                  maxHeight: 100.0,
                                                ),
                                                child:
                                                    const SingleChildScrollView(
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                            AppColor.textColor),
                                                    scrollPhysics:
                                                        NeverScrollableScrollPhysics(),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: Container(
                                                constraints:
                                                    const BoxConstraints(
                                                  minHeight: 10.0,
                                                  maxHeight: 100.0,
                                                ),
                                                child:
                                                    const SingleChildScrollView(
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                            AppColor.textColor),
                                                    scrollPhysics:
                                                        NeverScrollableScrollPhysics(),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: Container(
                                                constraints:
                                                    const BoxConstraints(
                                                  minHeight: 10.0,
                                                  maxHeight: 100.0,
                                                ),
                                                child:
                                                    const SingleChildScrollView(
                                                  child: TextField(
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                            AppColor.textColor),
                                                    scrollPhysics:
                                                        NeverScrollableScrollPhysics(),
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.all(0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Table(
                                            border: TableBorder.all(
                                                color: Colors.black26),
                                            children: [
                                              TableRow(children: [
                                                Container(
                                                    height: 90.0,
                                                    child: Center(
                                                        child: Text(
                                                      'Flight rules'
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppFont.OutfitFont,
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    )))
                                              ]),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Table(
                                            border: TableBorder.all(
                                                color: Colors.black26),
                                            children: [
                                              TableRow(children: [
                                                Container(
                                                    height: 30.0,
                                                    child: Center(
                                                        child: Text(
                                                      'VFR',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppFont.OutfitFont,
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ))),
                                                Container(
                                                  height: 30.0,
                                                  child: Checkbox(
                                                    value: _isCheckedx,
                                                    activeColor:
                                                        AppColor.primaryColor,
                                                    checkColor: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 5.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        _isCheckedx =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                    height: 30.0,
                                                    child: Center(
                                                        child: Text(
                                                      'IFR',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppFont.OutfitFont,
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ))),
                                                Container(
                                                  height: 30.0,
                                                  child: Checkbox(
                                                    value: _isCheckedx,
                                                    activeColor:
                                                        AppColor.primaryColor,
                                                    checkColor: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 5.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        _isCheckedx =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ]),
                                              TableRow(children: [
                                                Container(
                                                    height: 30.0,
                                                    child: Center(
                                                        child: Text(
                                                      'SVFR',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            AppFont.OutfitFont,
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ))),
                                                Container(
                                                  height: 30.0,
                                                  child: Checkbox(
                                                    value: _isCheckedx,
                                                    activeColor:
                                                        AppColor.primaryColor,
                                                    checkColor: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 5.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        _isCheckedx =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Table(
                              border: const TableBorder(
                                top: BorderSide(color: Colors.black26),
                                left: BorderSide(color: Colors.black26),
                                right: BorderSide(color: Colors.black26),
                                horizontalInside:
                                    BorderSide(color: Colors.black26),
                                verticalInside:
                                    BorderSide(color: Colors.black26),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(150.0),
                                1: FixedColumnWidth(200.0),
                                2: FixedColumnWidth(200.0),
                                3: FixedColumnWidth(200.0),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Container()),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'DEPARTURE TIME (LT) '.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'CRUISING '.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Speed (KTS)'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                            Table(
                              border: TableBorder.all(color: Colors.black26),
                              columnWidths: const {
                                0: FixedColumnWidth(150.0),
                                1: FixedColumnWidth(100.0),
                                2: FixedColumnWidth(100.0),
                                3: FixedColumnWidth(100.0),
                                4: FixedColumnWidth(100.0),
                                5: FixedColumnWidth(100.0),
                                6: FixedColumnWidth(100.0),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Departure Base'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Estimated'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Actual'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Speed (KTS)'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'ALT (FT)'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'HRS'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'MIN'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Table(
                              border: TableBorder.all(color: Colors.black26),
                              columnWidths: const {
                                0: FixedColumnWidth(500.0),
                                1: FixedColumnWidth(250.0),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Route of flight'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'alternate'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Table(
                              border: TableBorder.all(color: Colors.black26),
                              columnWidths: const {
                                0: FixedColumnWidth(375.0),
                                1: FixedColumnWidth(375.0),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Pilot-in-command'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Co-pilot'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 10.0,
                                        maxHeight: 100.0,
                                      ),
                                      child: const SingleChildScrollView(
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: AppColor.textColor),
                                          scrollPhysics:
                                              NeverScrollableScrollPhysics(),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'CUSTOMER : '.toUpperCase(),
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintStyle: const TextStyle(
                                                color: Color(0xFFCACAC9)),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFCACAC9)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFF626262)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFCACAC9)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            Card(
                              color: AppColor.primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, // Space between icon and text
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, // Vertically centers icon and text
                                  children: [
                                    Expanded(
                                      // Ensures the text stays centered
                                      child: Text(
                                        'FLIGHT LOG'.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Table(
                              border: const TableBorder(
                                top: BorderSide(color: Colors.black26),
                                left: BorderSide(color: Colors.black26),
                                right: BorderSide(color: Colors.black26),
                                bottom: BorderSide(color: Colors.black26),
                                horizontalInside:
                                    BorderSide(color: Colors.black26),
                                verticalInside:
                                    BorderSide(color: Colors.black26),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(172.0),
                                1: FixedColumnWidth(117.0),
                                2: FixedColumnWidth(115.0),
                                3: FixedColumnWidth(115.0),
                                4: FixedColumnWidth(115.0),
                                5: FixedColumnWidth(115.0),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Container()),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Flight 1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Offshore Field Operations',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Flight 2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Flight 3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Flight 4',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppFont.OutfitFont,
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),

                            Container(
                              color: AppColor.secondaryColor,
                              child: Table(
                                columnWidths: const {
                                  0: FixedColumnWidth(750.0),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'PRE-FLIGHT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors
                                              .white, // Change text color for contrast
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26),
                                        left:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'FROM',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'TO',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'DIST (NM)',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'G/S (KTS)',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'EST. Fit. Time',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 50.0,
                                            child: Center(
                                                child: Text(
                                              'Est. Fuel Req.\n(KG/LBS)',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 50.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                      horizontalInside:
                                          BorderSide(color: Colors.black26),
                                      verticalInside:
                                          BorderSide(color: Colors.black26),
                                      right: BorderSide(color: Colors.black26),
                                      bottom: BorderSide(color: Colors.black26),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 200.0,
                                            child: Center(
                                                child: Text(
                                              "As Req'd Inner\nField Ops",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )))
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 50.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 50.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 50.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              color: AppColor.secondaryColor,
                              child: Table(
                                columnWidths: const {
                                  0: FixedColumnWidth(750.0),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'WEIGHT & BALANCE',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors
                                              .white, // Change text color for contrast
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26),
                                        left:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Empty Weight',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Crew',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Pax Fwd',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Pax Aft',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Baggage/ Cargo',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Fuel On Dep.',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Take-off Weight',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                              'Cof G',
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 50.0,
                                            child: Center(
                                                child: Text(
                                              'W&B in limits',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 50.0,
                                            child: Center(
                                                child: Text(
                                              'Last Minute Change',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ))),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Pilot\ninitials',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Checkbox(
                                                  value: _isCheckedx,
                                                  activeColor:
                                                      AppColor.primaryColor,
                                                  checkColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isCheckedx =
                                                          value ?? false;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),



                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "PAX",
                                                      hintStyle: const TextStyle(
                                                      fontSize: 6.0,
                                                          color: Color( 0x6B000000),

                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "CARGO",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                       
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "TOW",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                      horizontalInside:
                                          BorderSide(color: Colors.black26),
                                      verticalInside:
                                          BorderSide(color: Colors.black26),
                                      right: BorderSide(color: Colors.black26),
                                      bottom: BorderSide(color: Colors.black26),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 340.0,
                                            child: Center(
                                                child: Text(
                                              "As Req'd Inner\nField Ops",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )))
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Pilot\ninitials',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                    AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Checkbox(
                                                  value: _isCheckedx,
                                                  activeColor:
                                                  AppColor.primaryColor,
                                                  checkColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        4.0),
                                                  ),
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isCheckedx =
                                                          value ?? false;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),



                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "PAX",
                                                      hintStyle: const TextStyle(
                                                        fontSize: 6.0,
                                                        color: Color( 0x6B000000),

                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "CARGO",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "TOW",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Pilot\ninitials',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                    AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Checkbox(
                                                  value: _isCheckedx,
                                                  activeColor:
                                                  AppColor.primaryColor,
                                                  checkColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        4.0),
                                                  ),
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isCheckedx =
                                                          value ?? false;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),



                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "PAX",
                                                      hintStyle: const TextStyle(
                                                        fontSize: 6.0,
                                                        color: Color( 0x6B000000),

                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "CARGO",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "TOW",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.black26),
                                        verticalInside:
                                            BorderSide(color: Colors.black26),
                                        right:
                                            BorderSide(color: Colors.black26),
                                        bottom:
                                            BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7.0,
                                                      vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Pilot\ninitials',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                    AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Checkbox(
                                                  value: _isCheckedx,
                                                  activeColor:
                                                  AppColor.primaryColor,
                                                  checkColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        4.0),
                                                  ),
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isCheckedx =
                                                          value ?? false;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),



                                      TableRow(
                                        children: [
                                          Container(
                                            height: 50.0,
                                            alignment: Alignment.center,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "PAX",
                                                      hintStyle: const TextStyle(
                                                        fontSize: 6.0,
                                                        color: Color( 0x6B000000),

                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "CARGO",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppColor.textColor,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding: EdgeInsets.zero,
                                                      hintText: "TOW",
                                                      hintStyle: const TextStyle(
                                                          fontSize: 6.0,
                                                          color: Color( 0x6B000000)
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF626262)),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(0),
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFFCACAC9)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),


                            Container(
                              color: AppColor.secondaryColor,
                              child: Table(
                                columnWidths: const {
                                  0: FixedColumnWidth(750.0),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'FUEL',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors
                                              .white, // Change text color for contrast
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26),
                                        left:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Burn Rate',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 60.0,
                                            child: Center(
                                                child: Text(
                                                  '15 Min. Fuel Checks',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Landing Fuel',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Consumption',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Fuel Uplift',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                      horizontalInside:
                                      BorderSide(color: Colors.black26),
                                      verticalInside:
                                      BorderSide(color: Colors.black26),
                                      right: BorderSide(color: Colors.black26),
                                      bottom: BorderSide(color: Colors.black26),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Variable',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Completed',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 120.0,
                                            child: Center(
                                                child: Text(
                                                  "As Req'd Inner\nField Ops",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )))
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ],
                            ),


                            Container(
                              color: AppColor.secondaryColor,
                              child: Table(
                                columnWidths: const {
                                  0: FixedColumnWidth(750.0),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'FLIGHT TIME',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors
                                              .white, // Change text color for contrast
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26),
                                        left:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Take-off time (LT) ',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Landing time (LT)',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                            height: 30.0,
                                            child: Center(
                                                child: Text(
                                                  'Act. Flt Time',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ))),
                                      ]),
                                       
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                       
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                      horizontalInside:
                                      BorderSide(color: Colors.black26),
                                      verticalInside:
                                      BorderSide(color: Colors.black26),
                                      right: BorderSide(color: Colors.black26),
                                      bottom: BorderSide(color: Colors.black26),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 90.0,
                                            child: Center(
                                                child: Text(
                                                  "As Req'd Inner\nField Ops",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )))
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 30.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                       
                                    ],
                                  ),
                                ),
                              ],
                            ),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26),
                                        left:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 50.0,
                                            child: Center(
                                                child: Text(
                                                  'COMMENTS',
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ))),
                                      ]),
                                       

                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 50.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),


                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                      horizontalInside:
                                      BorderSide(color: Colors.black26),
                                      verticalInside:
                                      BorderSide(color: Colors.black26),
                                      right: BorderSide(color: Colors.black26),
                                      bottom: BorderSide(color: Colors.black26),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                            height: 50.0,
                                            child: Center(
                                                child: Text(
                                                  "TOTAL FLT TIME\n(HR: MIN)",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: AppFont.OutfitFont,
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )))
                                      ]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Table(
                                    border: TableBorder(
                                        horizontalInside:
                                        BorderSide(color: Colors.black26),
                                        verticalInside:
                                        BorderSide(color: Colors.black26),
                                        right:
                                        BorderSide(color: Colors.black26),
                                        bottom:
                                        BorderSide(color: Colors.black26)),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 50.0,
                                          alignment: Alignment.center,
                                          child: TextField(
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: AppColor.textColor,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 7.0,
                                                  vertical: 14.0),
                                            ),
                                          ),
                                        ),
                                      ]),
                                       

                                    ],
                                  ),
                                ),

                              ],
                            ),

                            const SizedBox(height: 15),

                            Row(
                              children: [
                                Expanded(
                                  flex:3,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text('Note: ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      const SizedBox(width: 0),
                                      Text('Positive identification is required and must be verified for \nall passengers prior to departure on all sectors.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          )),

                                       
                                    ],
                                  ),
                                ),
                                // const SizedBox(width: 5),

                                const SizedBox(width: 20),
                                Expanded(
                                  flex:1,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          'SIGNED BY:', // Label for the first text field
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      const SizedBox(width: 10),
                                      Checkbox(
                                        value: _isCheckedx,
                                        activeColor:
                                        AppColor.primaryColor,
                                        checkColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(
                                              4.0),
                                        ),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isCheckedx =
                                                value ?? false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),


                            const SizedBox(height: 15),


                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // EasyLoading.show( status: 'Updating...');
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith((states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return Colors.white;
                                    }
                                    return Colors.white70;
                                  }),
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith((states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return (Color(0xFFE8374F));
                                    }
                                    return (Color(0xFFAA182C));
                                  }),
                                  padding: WidgetStateProperty.all(
                                      const EdgeInsets.all(13.0)),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontFamily: AppFont.OutfitFont,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
