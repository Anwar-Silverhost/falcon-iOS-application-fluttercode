import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_font.dart';
import '../../../../utils/app_sp.dart';
import '../../profile/profile_screen.dart';

class DiscretionReport extends StatefulWidget {
  const DiscretionReport({super.key});

  @override
  State<DiscretionReport> createState() => _DiscretionReportState();
}

class _DiscretionReportState extends State<DiscretionReport> {
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
                            // Card with the heading
                            Card(
                              color: AppColor.primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          "/forms",
                                        );
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "COMMANDER'S DISCRETION REPORT - RW"
                                            .toUpperCase(),
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
                            SizedBox(height: 20),

                            DefaultTabController(
                              length: 2,
                              child: Column(
                                children: [
                                  TabBar(
                                    indicator: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: AppColor.primaryColor,
                                            width: 3),
                                      ),
                                    ),
                                    tabs: [
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Tab(
                                            child: Text(
                                          'EXTENSION OF DUTY',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFont.OutfitFont,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: Tab(
                                            child: Text(
                                          'REDUCED REST',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFont.OutfitFont,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                      ),
                                    ],
                                    labelColor: AppColor.primaryColor,
                                    unselectedLabelColor: Colors.black,
                                    indicatorColor: AppColor.primaryColor,
                                    indicatorWeight: 3.0,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    child: TabBarView(
                                      children: [
                                        Column(children: [
                                          const SizedBox(height: 20),
                                          Center(
                                            child: Column(
                                              children: [
                                                Table(
                                                  border: TableBorder.all(
                                                      color: Colors.black26),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(80.0),
                                                    1: FixedColumnWidth(120.0),
                                                    2: FixedColumnWidth(120.0),
                                                    3: FixedColumnWidth(120.0),
                                                    4: FixedColumnWidth(160.0),
                                                    5: FixedColumnWidth(150.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'DATE',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Aircraft Type',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Aircraft Registration',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(200.0),
                                                    1: FixedColumnWidth(550.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Commander’s Name',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder.all(
                                                      color: Colors.black26),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(200.0),
                                                    1: FixedColumnWidth(120.0),
                                                    2: FixedColumnWidth(140.0),
                                                    3: FixedColumnWidth(120.0),
                                                    4: FixedColumnWidth(170.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Crew Involved in Discretion',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'PIC',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'SIC',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Card(
                                                  color: AppColor.primaryColor,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween, // Space between icon and text
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center, // Vertically centers icon and text
                                                      children: [
                                                        Expanded(
                                                          // Ensures the text stays centered
                                                          child: Text(
                                                            'Schedule'
                                                                .toUpperCase(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Table(
                                                  border: TableBorder.all(
                                                      color: Colors.black26),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(150.0),
                                                    1: FixedColumnWidth(600.0),
                                                    // 2: FixedColumnWidth(200.0),
                                                    // 3: FixedColumnWidth(200.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Flight Type *',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(150.0),
                                                    1: FixedColumnWidth(600.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Routing',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(150.0),
                                                    1: FixedColumnWidth(200.0),
                                                    2: FixedColumnWidth(200.0),
                                                    3: FixedColumnWidth(200.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Container(),
                                                      Container(),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'UTC** (hh:mm)',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'LT (hh:mm)',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(150.0),
                                                    1: FixedColumnWidth(200.0),
                                                    2: FixedColumnWidth(200.0),
                                                    3: FixedColumnWidth(200.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'FDP Start',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(350.0),
                                                    1: FixedColumnWidth(400.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Allowed FDP',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Card(
                                                  color: AppColor.primaryColor,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween, // Space between icon and text
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center, // Vertically centers icon and text
                                                      children: [
                                                        Expanded(
                                                          // Ensures the text stays centered
                                                          child: Text(
                                                            'Actual'
                                                                .toUpperCase(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      top: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(150.0),
                                                    1: FixedColumnWidth(200.0),
                                                    2: FixedColumnWidth(200.0),
                                                    3: FixedColumnWidth(200.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Container(),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Place',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'UTC** (hh:mm)',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'LT (hh:mm)',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(150.0),
                                                    1: FixedColumnWidth(200.0),
                                                    2: FixedColumnWidth(200.0),
                                                    3: FixedColumnWidth(200.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'FDP Start',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(150.0),
                                                    1: FixedColumnWidth(200.0),
                                                    2: FixedColumnWidth(200.0),
                                                    3: FixedColumnWidth(200.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'FDP End',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(350.0),
                                                    1: FixedColumnWidth(400.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'Actual FDP',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      verticalInside:
                                                          BorderSide(
                                                              color: Colors
                                                                  .black26),
                                                      right: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      bottom: BorderSide(
                                                          color:
                                                              Colors.black26),
                                                      left: BorderSide(
                                                          color:
                                                              Colors.black26)),
                                                  columnWidths: const {
                                                    0: FixedColumnWidth(350.0),
                                                    1: FixedColumnWidth(400.0),
                                                  },
                                                  children: [
                                                    TableRow(children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Text(
                                                          'FDP Exceedance',
                                                          style: TextStyle(
                                                            fontFamily: AppFont
                                                                .OutfitFont,
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
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
                                                                  fontSize:
                                                                      16.0,
                                                                  color: AppColor
                                                                      .textColor),
                                                              scrollPhysics:
                                                                  NeverScrollableScrollPhysics(),
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Commander's Reason For Extension",
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Container(
                                                            // height:200,
                                                            constraints:
                                                                const BoxConstraints(
                                                              minHeight:
                                                                  60.0, // Increased minHeight
                                                              maxHeight:
                                                                  150.0, // Increased maxHeight
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: TextField(
                                                                maxLines:
                                                                    3, // Allow the TextField to expand vertically
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintStyle:
                                                                      const TextStyle(
                                                                          color:
                                                                              Color(0xFFCACAC9)),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Color(0xFFCACAC9)),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Color(0xFF626262)),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Color(0xFFCACAC9)),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16), // Add padding inside the TextField
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                        width:
                                                            16), // Spacing between fields
                                                    // Right Side Fields (Date and Number)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const SizedBox(
                                                            height: 20),
                                                        SizedBox(
                                                          width: 120,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                'Signature',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      AppFont
                                                                          .OutfitFont,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Checkbox(
                                                                value:
                                                                    _isCheckedx,
                                                                activeColor:
                                                                    AppColor
                                                                        .primaryColor,
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    _isCheckedx =
                                                                        value ??
                                                                            false;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 120,
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: 'Date',
                                                              hintStyle: const TextStyle(
                                                                  color: Color(
                                                                      0xFFCACAC9)),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xFFCACAC9)),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xFF626262)),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xFFCACAC9)),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          8),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Operator's Remarks/Actions taken",
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Container(
                                                            // height:200,
                                                            constraints:
                                                                const BoxConstraints(
                                                              minHeight:
                                                                  60.0, // Increased minHeight
                                                              maxHeight:
                                                                  150.0, // Increased maxHeight
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: TextField(
                                                                maxLines:
                                                                    3, // Allow the TextField to expand vertically
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintStyle:
                                                                      const TextStyle(
                                                                          color:
                                                                              Color(0xFFCACAC9)),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Color(0xFFCACAC9)),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Color(0xFF626262)),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Color(0xFFCACAC9)),
                                                                  ),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16), // Add padding inside the TextField
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    const SizedBox(
                                                        width:
                                                            16), // Spacing between fields
                                                    // Right Side Fields (Date and Number)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const SizedBox(
                                                            height: 20),
                                                        SizedBox(
                                                          width: 120,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                'Signature',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      AppFont
                                                                          .OutfitFont,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Checkbox(
                                                                value:
                                                                    _isCheckedx,
                                                                activeColor:
                                                                    AppColor
                                                                        .primaryColor,
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  side:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    _isCheckedx =
                                                                        value ??
                                                                            false;
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 120,
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: 'Date',
                                                              hintStyle: const TextStyle(
                                                                  color: Color(
                                                                      0xFFCACAC9)),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xFFCACAC9)),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xFF626262)),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xFFCACAC9)),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          8),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                                SizedBox(
                                                  width: 150.00,
                                                  child: ElevatedButton(
                                                    onPressed: () {

                                                    },
                                                    style: ButtonStyle(
                                                      foregroundColor:
                                                      WidgetStateProperty.resolveWith((states) {
                                                        if (states.contains(WidgetState.pressed)) {
                                                          return Colors.white70;
                                                        }
                                                        return Colors.white;
                                                      }),
                                                      backgroundColor:
                                                      WidgetStateProperty.resolveWith((states) {
                                                        if (states.contains(WidgetState.pressed)) {
                                                          return (Color(0xFFE8374F));
                                                        }
                                                        return (Color(0xFFAA182C));
                                                      }),
                                                      padding: WidgetStateProperty.all(
                                                          const EdgeInsets.all(8.0)),
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
                                              ],
                                            ),
                                          )
                                        ]),
                                        Column(
                                          children: [
                                            const SizedBox(height: 20),
                                            Center(
                                              child: Column(
                                                children: [
                                                  Table(
                                                    border: TableBorder.all(
                                                        color: Colors.black26),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(80.0),
                                                      1: FixedColumnWidth(
                                                          120.0),
                                                      2: FixedColumnWidth(
                                                          120.0),
                                                      3: FixedColumnWidth(
                                                          120.0),
                                                      4: FixedColumnWidth(
                                                          160.0),
                                                      5: FixedColumnWidth(
                                                          150.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'DATE',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Aircraft Type',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Aircraft Registration',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  Table(
                                                    border: TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        verticalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        right: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        left: BorderSide(
                                                            color: Colors
                                                                .black26)),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          200.0),
                                                      1: FixedColumnWidth(
                                                          550.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Commander’s Name',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  Table(
                                                    border: TableBorder.all(
                                                        color: Colors.black26),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          200.0),
                                                      1: FixedColumnWidth(
                                                          120.0),
                                                      2: FixedColumnWidth(
                                                          140.0),
                                                      3: FixedColumnWidth(
                                                          120.0),
                                                      4: FixedColumnWidth(
                                                          170.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Crew Involved in Discretion',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'PIC',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'SIC',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        // Wrap this in an Expanded widget
                                                        child: Container(
                                                          child: RichText(
                                                            text: TextSpan(
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily: AppFont
                                                                    .OutfitFont,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black, // Default color
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      'An aircraft commander may take discretion to reduce rest after considering the below points: \n',
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' (Please check on the below ☑)',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red), // Change this to red
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Card(
                                                    elevation: 0,
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                        color: Colors.grey,
                                                        width: 0.5,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value:
                                                                        _isCheckedx,
                                                                    activeColor:
                                                                        AppColor
                                                                            .primaryColor,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    onChanged:
                                                                        (bool?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        _isCheckedx =
                                                                            value ??
                                                                                false;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Text(
                                                                    'Taking note of the circumstances of other members of the crew to reduce the rest period.',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .OutfitFont,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .black, // Default color
                                                                    ),
                                                                  )), // Text next to checkbox
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value:
                                                                        _isCheckedx,
                                                                    activeColor:
                                                                        AppColor
                                                                            .primaryColor,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    onChanged:
                                                                        (bool?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        _isCheckedx =
                                                                            value ??
                                                                                false;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Text(
                                                                    'Reduced Rest Period is not used to reduce successive rest periods.',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .OutfitFont,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .black, // Default color
                                                                    ),
                                                                  )), // Text next to checkbox
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value:
                                                                        _isCheckedx,
                                                                    activeColor:
                                                                        AppColor
                                                                            .primaryColor,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    onChanged:
                                                                        (bool?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        _isCheckedx =
                                                                            value ??
                                                                                false;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Text(
                                                                    'If the preceding FDP was extended then, the rest period may be reduced provided that the subsequent allowable FDP is also reduced by the same amount.',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .OutfitFont,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .black, // Default color
                                                                    ),
                                                                  )), // Text next to checkbox
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value:
                                                                        _isCheckedx,
                                                                    activeColor:
                                                                        AppColor
                                                                            .primaryColor,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    onChanged:
                                                                        (bool?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        _isCheckedx =
                                                                            value ??
                                                                                false;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Text(
                                                                    'In NO circumstances, may a commander exercise discretion to reduce a rest period below 10 hours.',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .OutfitFont,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .black, // Default color
                                                                    ),
                                                                  )), // Text next to checkbox
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value:
                                                                        _isCheckedx,
                                                                    activeColor:
                                                                        AppColor
                                                                            .primaryColor,
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    onChanged:
                                                                        (bool?
                                                                            value) {
                                                                      setState(
                                                                          () {
                                                                        _isCheckedx =
                                                                            value ??
                                                                                false;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          Text(
                                                                    'This Discretion is taken due to emergency and NOT due to any commercial practices.',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .OutfitFont,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .black, // Default color
                                                                    ),
                                                                  )), // Text next to checkbox
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Table(
                                                    border: TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        verticalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        right: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        top: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        left: BorderSide(
                                                            color: Colors
                                                                .black26)),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          350.0),
                                                      1: FixedColumnWidth(
                                                          200.0),
                                                      2: FixedColumnWidth(
                                                          200.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Container(),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'UTC** (hh:mm)',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'LT (hh:mm)',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  Table(
                                                    border: TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        verticalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        right: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        left: BorderSide(
                                                            color: Colors
                                                                .black26)),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          350.0),
                                                      1: FixedColumnWidth(
                                                          200.0),
                                                      2: FixedColumnWidth(
                                                          200.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Last duty Started',
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  Table(
                                                    border: TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        verticalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        right: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        left: BorderSide(
                                                            color: Colors
                                                                .black26)),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          350.0),
                                                      1: FixedColumnWidth(
                                                          200.0),
                                                      2: FixedColumnWidth(
                                                          200.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Last duty Ended',
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  Table(
                                                    border: TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        verticalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        right: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        left: BorderSide(
                                                            color: Colors
                                                                .black26)),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          350.0),
                                                      1: FixedColumnWidth(
                                                          400.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Rest Earned',
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  Table(
                                                    border: TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        verticalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        right: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        left: BorderSide(
                                                            color: Colors
                                                                .black26)),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          350.0),
                                                      1: FixedColumnWidth(
                                                          200.0),
                                                      2: FixedColumnWidth(
                                                          200.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Actual start of next FDP',
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  Table(
                                                    border: TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        verticalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black26),
                                                        right: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        bottom: BorderSide(
                                                            color:
                                                                Colors.black26),
                                                        left: BorderSide(
                                                            color: Colors
                                                                .black26)),
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(
                                                          350.0),
                                                      1: FixedColumnWidth(
                                                          400.0),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'Rest Period Reduced By',
                                                            style: TextStyle(
                                                              fontFamily: AppFont
                                                                  .OutfitFont,
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
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
                                                                    fontSize:
                                                                        16.0,
                                                                    color: AppColor
                                                                        .textColor),
                                                                scrollPhysics:
                                                                    NeverScrollableScrollPhysics(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Commander's Reason For Extension",
                                                              style: TextStyle(
                                                                fontFamily: AppFont
                                                                    .OutfitFont,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Container(
                                                              // height:200,
                                                              constraints:
                                                                  const BoxConstraints(
                                                                minHeight:
                                                                    60.0, // Increased minHeight
                                                                maxHeight:
                                                                    150.0, // Increased maxHeight
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    TextField(
                                                                  maxLines:
                                                                      3, // Allow the TextField to expand vertically
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintStyle:
                                                                        const TextStyle(
                                                                            color:
                                                                                Color(0xFFCACAC9)),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Color(0xFFCACAC9)),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Color(0xFF626262)),
                                                                    ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Color(0xFFCACAC9)),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            16), // Add padding inside the TextField
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      const SizedBox(
                                                          width:
                                                              16), // Spacing between fields
                                                      // Right Side Fields (Date and Number)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                              height: 20),
                                                          SizedBox(
                                                            width: 120,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                  'Signature',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        AppFont
                                                                            .OutfitFont,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Checkbox(
                                                                  value:
                                                                      _isCheckedx,
                                                                  activeColor:
                                                                      AppColor
                                                                          .primaryColor,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      _isCheckedx =
                                                                          value ??
                                                                              false;
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 120,
                                                            child: TextField(
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Date',
                                                                hintStyle: const TextStyle(
                                                                    color: Color(
                                                                        0xFFCACAC9)),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              Color(0xFFCACAC9)),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              Color(0xFF626262)),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              Color(0xFFCACAC9)),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            8,
                                                                        horizontal:
                                                                            8),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Operator's Remarks/Actions taken",
                                                              style: TextStyle(
                                                                fontFamily: AppFont
                                                                    .OutfitFont,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Container(
                                                              // height:200,
                                                              constraints:
                                                                  const BoxConstraints(
                                                                minHeight:
                                                                    60.0, // Increased minHeight
                                                                maxHeight:
                                                                    150.0, // Increased maxHeight
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child:
                                                                    TextField(
                                                                  maxLines:
                                                                      3, // Allow the TextField to expand vertically
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintStyle:
                                                                        const TextStyle(
                                                                            color:
                                                                                Color(0xFFCACAC9)),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Color(0xFFCACAC9)),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Color(0xFF626262)),
                                                                    ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: Color(0xFFCACAC9)),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            16), // Add padding inside the TextField
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      const SizedBox(
                                                          width:
                                                              16), // Spacing between fields
                                                      // Right Side Fields (Date and Number)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                              height: 20),
                                                          SizedBox(
                                                            width: 120,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                  'Signature',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        AppFont
                                                                            .OutfitFont,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                Checkbox(
                                                                  value:
                                                                      _isCheckedx,
                                                                  activeColor:
                                                                      AppColor
                                                                          .primaryColor,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      _isCheckedx =
                                                                          value ??
                                                                              false;
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 120,
                                                            child: TextField(
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Date',
                                                                hintStyle: const TextStyle(
                                                                    color: Color(
                                                                        0xFFCACAC9)),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              Color(0xFFCACAC9)),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              Color(0xFF626262)),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              Color(0xFFCACAC9)),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            8,
                                                                        horizontal:
                                                                            8),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                  SizedBox(
                                                    width: 150.00,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor:
                                                        WidgetStateProperty.resolveWith((states) {
                                                          if (states.contains(WidgetState.pressed)) {
                                                            return Colors.white70;
                                                          }
                                                          return Colors.white;
                                                        }),
                                                        backgroundColor:
                                                        WidgetStateProperty.resolveWith((states) {
                                                          if (states.contains(WidgetState.pressed)) {
                                                            return (Color(0xFFE8374F));
                                                          }
                                                          return (Color(0xFFAA182C));
                                                        }),
                                                        padding: WidgetStateProperty.all(
                                                            const EdgeInsets.all(8.0)),
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
                            ),

                            // SizedBox(
                            //   width: double.infinity,
                            //   child: ElevatedButton(
                            //     onPressed: () {
                            //       // EasyLoading.show( status: 'Updating...');
                            //     },
                            //     style: ButtonStyle(
                            //       foregroundColor:
                            //           WidgetStateProperty.resolveWith((states) {
                            //         if (states.contains(WidgetState.pressed)) {
                            //           return Colors.white;
                            //         }
                            //         return Colors.white70;
                            //       }),
                            //       backgroundColor:
                            //           WidgetStateProperty.resolveWith((states) {
                            //         if (states.contains(WidgetState.pressed)) {
                            //           return Color(0xFFE8374F);
                            //         }
                            //         return Color(0xFFAA182C);
                            //       }),
                            //       padding: WidgetStateProperty.all(
                            //           const EdgeInsets.all(13.0)),
                            //       shape: WidgetStateProperty.all(
                            //         RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //       ),
                            //     ),
                            //     child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //         fontFamily: AppFont.OutfitFont,
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(height: 25),
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
