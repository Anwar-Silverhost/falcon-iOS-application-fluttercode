import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_font.dart';
import '../../../../utils/app_sp.dart';
import '../../profile/profile_screen.dart';

class RotaryWingJourneyLog extends StatefulWidget {
  const RotaryWingJourneyLog({super.key});

  @override
  State<RotaryWingJourneyLog> createState() => _RotaryWingJourneyLogState();
}

class _RotaryWingJourneyLogState extends State<RotaryWingJourneyLog> {
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
                                            'Rotary Wing Journey Log'
                                                .toUpperCase(),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Icon(
                                      Icons
                                          .calendar_month_outlined, // Calendar icon
                                      color: AppColor.primaryColor,
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Space between icon and date text
                                    Text(
                                      '12/10/2012'.toUpperCase(),
                                      textAlign: TextAlign.left,
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
                            const SizedBox(height: 20),
                            Center(
                              child: Table(
                                border: TableBorder.all(color: Colors.grey),
                                columnWidths: const {
                                  0: FixedColumnWidth(120.0),
                                  1: FixedColumnWidth(80.0),
                                  2: FixedColumnWidth(220.0),
                                  3: FixedColumnWidth(220.0),
                                  4: FixedColumnWidth(100.0),
                                },
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'Crew Names',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Allowed',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Actual FDP',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Actual Duty',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Duty type *',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(' ',
                                          textAlign: TextAlign.center),
                                    ),


                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                insetPadding: EdgeInsets.symmetric(horizontal: 10),
                                                backgroundColor: Colors.transparent,
                                                child: Stack(
                                                  children: [
                                                    // Set width and height for the dialog box
                                                    SizedBox(
                                                      width: 600, // Set desired width
                                                      height: 400, // Set desired height
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          image: DecorationImage(
                                                            image: AssetImage(ftltable),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // Close button positioned at top right
                                                    Positioned(
                                                      right: 0,
                                                      top: 0,
                                                      child: IconButton(
                                                        icon: Icon(Icons.close, color: Colors.transparent),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          'FDP',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                            fontFamily: 'Outfit',
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),



                                    // Padding(
                                    //   padding: EdgeInsets.all(10),
                                    //   child: Text(
                                    //     'FDP',
                                    //     textAlign: TextAlign.center,
                                    //     style: TextStyle(
                                    //       fontFamily: AppFont.OutfitFont,
                                    //       color: Colors.black,
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.normal,
                                    //     ),
                                    //   ),
                                    // ),


                                    Table(
                                      border: TableBorder(
                                        verticalInside:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              'FDP Start',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'FDP Finish',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'Total FDP',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Table(
                                      border: TableBorder(
                                        verticalInside: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'DP Start',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'DP Finish',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'Total DP',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: AppFont.OutfitFont,
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(' ',
                                          textAlign: TextAlign.center),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'PIC',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppFont.OutfitFont,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: AppColor.textColor,
                                                  ),
                                                  maxLines: null,
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .characters,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 10.0,
                                          maxHeight: 100.0,
                                        ),
                                        child: SingleChildScrollView(
                                          child: TextField(
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textColor),
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder
                                                  .none, // Remove underline
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Table(
                                      border: TableBorder(
                                        verticalInside:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
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
                                        verticalInside:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 10.0,
                                          maxHeight: 100.0,
                                        ),
                                        child: SingleChildScrollView(
                                          child: TextField(
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textColor),
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder
                                                  .none, // Remove underline
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'SIC',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppFont.OutfitFont,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .characters,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 10.0,
                                          maxHeight: 100.0,
                                        ),
                                        child: SingleChildScrollView(
                                          child: TextField(
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textColor),
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder
                                                  .none, // Remove underline
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Table(
                                      border: TableBorder(
                                        verticalInside:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
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
                                        verticalInside:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 10.0,
                                          maxHeight: 100.0,
                                        ),
                                        child: SingleChildScrollView(
                                          child: TextField(
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textColor),
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder
                                                  .none, // Remove underline
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'SIMI/SIME',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppFont.OutfitFont,
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .characters,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 10.0,
                                          maxHeight: 100.0,
                                        ),
                                        child: SingleChildScrollView(
                                          child: TextField(
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textColor),
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder
                                                  .none, // Remove underline
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Table(
                                      border: TableBorder(
                                        verticalInside:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
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
                                        verticalInside:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minHeight: 10.0,
                                                maxHeight: 100.0,
                                              ),
                                              child: SingleChildScrollView(
                                                child: TextField(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          AppColor.textColor),
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.0,
                                                            horizontal: 5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: 10.0,
                                          maxHeight: 100.0,
                                        ),
                                        child: SingleChildScrollView(
                                          child: TextField(
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColor.textColor),
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              border: InputBorder
                                                  .none, // Remove underline
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 5.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    // Left Side Section
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Commander`s Discretion Report Filed?',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        AppFont.OutfitFont,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Checkbox(
                                                    value: false,
                                                    onChanged: (value) {}),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Type of Discretion',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        AppFont.OutfitFont,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Text(
                                                  'Extending',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        AppFont.OutfitFont,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Checkbox(
                                                    value: false,
                                                    onChanged: (value) {}),
                                                Text(
                                                  '/Reducing',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        AppFont.OutfitFont,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Checkbox(
                                                    value: false,
                                                    onChanged: (value) {}),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),


                            Center(
                              child: Container(
                                child: SingleChildScrollView(
                                  primary: false,
                                  scrollDirection: Axis.horizontal,
                                  child: Table(
                                    border: TableBorder.all(color: Colors.black26),
                                    columnWidths: const {
                                      0: FixedColumnWidth(180.0),
                                      1: FixedColumnWidth(120.0),
                                      2: FixedColumnWidth(120.0),
                                      3: FixedColumnWidth(140.0),
                                      4: FixedColumnWidth(140.0),
                                      5: FixedColumnWidth(140.0),
                                      6: FixedColumnWidth(140.0),
                                      7: FixedColumnWidth(140.0),
                                      8: FixedColumnWidth(150.0),
                                      9: FixedColumnWidth(180.0),
                                      10: FixedColumnWidth(50.0),
                                    },
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Flight Type**',
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
                                            'A/C Type',
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
                                            'A/C Registration',
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
                                            'Departure Station',
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
                                            'Arrival Station',
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
                                            'Start up time',
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
                                            'Shutdown time',
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
                                            'Block Time',
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
                                            'No. of Landings',
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
                                            'Contract Type***',
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
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Container(
                                child: SingleChildScrollView(
                                  primary: false,
                                  scrollDirection: Axis.horizontal,
                                  child: Table(
                                    border: TableBorder.all(color: Colors.black26),
                                    columnWidths: const {
                                      0: FixedColumnWidth(250.0), 
                                      1: FixedColumnWidth(250.0),  
                                      2: FixedColumnWidth(250.0),
                                    },
                                    children: [

                                      TableRow(children: [
                                         
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total Block Time:',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: AppFont.OutfitFont,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Container(
                                                constraints: const BoxConstraints(
                                                  minHeight: 10.0,
                                                  maxHeight: 100.0,
                                                ),
                                                child: const TextField(
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: AppColor.textColor,

                                                  ),
                                                  scrollPhysics: NeverScrollableScrollPhysics(),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total No of Landings:',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: AppFont.OutfitFont,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Container(
                                                constraints: const BoxConstraints(
                                                  minHeight: 10.0,
                                                  maxHeight: 100.0,
                                                ),
                                                child: const TextField(
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: AppColor.textColor,
                                                  ),
                                                  scrollPhysics: NeverScrollableScrollPhysics(),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total No. of IFR Approaches',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: AppFont.OutfitFont,
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Container(
                                                constraints: const BoxConstraints(
                                                  minHeight: 10.0,
                                                  maxHeight: 100.0,
                                                ),
                                                child: const TextField(
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: AppColor.textColor,
                                                  ),
                                                  scrollPhysics: NeverScrollableScrollPhysics(),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),


                                    ],
                                  ),
                                ),
                              ),
                            ),



                            const SizedBox(height: 20),


                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Split Duty Record',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: AppFont.OutfitFont,
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),




                            Center(
                              child: Container(
                                child: SingleChildScrollView(
                                  primary: false,
                                  scrollDirection: Axis.horizontal,
                                  child: Table(
                                    border: TableBorder.all(color: Colors.black26),
                                    columnWidths: const {
                                      0: FixedColumnWidth(250.0),
                                      1: FixedColumnWidth(150.0),
                                      2: FixedColumnWidth(200.0),
                                      3: FixedColumnWidth(140.0),
                                      4: FixedColumnWidth(140.0),
                                      5: FixedColumnWidth(140.0),
                                    },
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Time Of (After 15 min post flight)',
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
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Time On (Incl 30 min Pre Flight)',
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
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Rest (HRS)',
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
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Credit (HRS)',
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
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Max FDP (With Split)',
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
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Actual FDP',
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
                                ),
                              ),
                            ),


                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text('Crew Comments : ',

                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          )),
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

                            const SizedBox(height: 25),

                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text('Owner Signature :',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      const SizedBox(width: 0),
                                      Expanded(
                                        child: Checkbox(
                                          value: _isCheckedx,
                                          activeColor: AppColor.primaryColor,
                                          checkColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.grey,
                                              width: 5.0,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(4.0),
                                          ),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _isCheckedx = value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(width: 5),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Reviewed\nby OPS : ', // Label for the first text field
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      const SizedBox(width: 5),
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
                                const SizedBox(width: 25),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Electronically \n Recorded : ', // Label for the first text field
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      const SizedBox(width: 5),
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
















                            const SizedBox(height: 25),
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
