import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/app_color.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_font.dart';
import '../../../../utils/app_sp.dart';
import '../../../../utils/app_urls.dart';
import '../../profile/profile_screen.dart';

class CommercialFlightRecord extends StatefulWidget {
  const CommercialFlightRecord({super.key});

  @override
  State<CommercialFlightRecord> createState() => _CommercialFlightRecordState();
}

class _CommercialFlightRecordState extends State<CommercialFlightRecord> {

  List<Map<String, TextEditingController>> rows = [];
  int maxTripNo = 6;

  // List<Map<String, TextEditingController>> rows2 = [];
  List<Map<String, dynamic>> rows2 = [];

  int maxTripNo2 = 16;


  bool _isCheckedx = false;

  String userToken = '';
  String fullName = '';
  String selectedGroupName = '';
  List<dynamic> apps = [];
  String profilePic = '';
  String UserID = '';
  String selectedGroupId_id = '';

  String selectMaingroup = '';

  String selectMaingroupId = '';
  String commercial_flight_record_refno = '';

  String formattedTotalFlightTime = '';

  String tableletestdata = "";


  String _formStatus = '';


  String _totalflighttimevalue = "";
  String _startsengapuvalue = "";
  String _landingsvalue = "";
  String _slingloadsvalue = "";




  var profile = dummyProfile;


  var formId = 'FAF04';
  var currentDate = "${DateTime.now().day.toString().padLeft(2, '0')}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().year}";




  final TextEditingController _startsengapu = TextEditingController();
  final TextEditingController _landings = TextEditingController();
  final TextEditingController _slingloads = TextEditingController();
  final TextEditingController _sheetNumber = TextEditingController();


  @override
  void initState() {
    super.initState();
    getUserToken();
    // addNewRow(1);
    // addNewRow2(1);
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
    selectMaingroupId = await appSp.getSelected_MaingroupID();

    await formdata_pass_backend(UserID, userToken);


    setState(() {
      selectedGroupId_id = selectedGroupId_id;
    });
  }


  // void addNewRow(int tripNo) {
  //   if (tripNo <= maxTripNo) {
  //     rows.add({
  //       'tripNo': TextEditingController(text: tripNo.toString()),
  //       'emptyWt': TextEditingController(),
  //       'crewWt': TextEditingController(),
  //       'operatingWt': TextEditingController(),
  //       'rtow': TextEditingController(),
  //       'loadWt': TextEditingController(),
  //       'usefulLoad': TextEditingController(),
  //     });
  //   }
  // }

  void addRowWithValues(Map<String, dynamic> weightData) {
    rows.add({
      'tripNo': TextEditingController(text: weightData['tripNo'] ?? ''),
      'emptyWt': TextEditingController(text: weightData['emptyWt'] ?? ''),
      'crewWt': TextEditingController(text: weightData['crewWt'] ?? ''),
      'operatingWt': TextEditingController(text: weightData['operatingWt'] ?? ''),
      'rtow': TextEditingController(text: weightData['rtow'] ?? ''),
      'loadWt': TextEditingController(text: weightData['loadWt'] ?? ''),
      'usefulLoad': TextEditingController(text: weightData['usefulLoad'] ?? ''),
    });
  }

  void addNewRow(int tripNo) {
    if (tripNo <= maxTripNo) {
      rows.add({
        'tripNo': TextEditingController(text: tripNo.toString()),
        'emptyWt': TextEditingController(),
        'crewWt': TextEditingController(),
        'operatingWt': TextEditingController(),
        'rtow': TextEditingController(),
        'loadWt': TextEditingController(),
        'usefulLoad': TextEditingController(),
      });
    }
  }

  // void addNewRow2(int tripNo2) {
  //   if (tripNo2 <= maxTripNo2) {
  //     rows2.add({
  //       'tripNo': TextEditingController(text: tripNo2.toString()),
  //       'pilot': TextEditingController(),
  //       'copilot': TextEditingController(),
  //       'from': TextEditingController(),
  //       'to': TextEditingController(),
  //       'takeofftime': TextEditingController(),
  //       'landingtime': TextEditingController(),
  //       'flighttime': TextEditingController(),
  //       'nopax': TextEditingController(),
  //       'paxw': TextEditingController(),
  //       'cargow': TextEditingController(),
  //       'fuelw': TextEditingController(),
  //       'totalloadw': TextEditingController(),
  //       'cg': TextEditingController(),
  //       'pilotsign': TextEditingController(),
  //       'flightcategory': TextEditingController(),
  //     });
  //   }
  // }  TextEditingController(text: fligthData[''] ?? ''),



  void addRowWithValues2(Map<String, dynamic> flightData) {
    rows2.add({
      'tripNo': TextEditingController(text: flightData['tripNo'] ?? ''),
      'pilot': TextEditingController(text: flightData['pilot'] ?? ''),
      'copilot': TextEditingController(text: flightData['copilot'] ?? ''),
      'from': TextEditingController(text: flightData['from'] ?? ''),
      'to': TextEditingController(text: flightData['to'] ?? ''),
      'takeofftime': TextEditingController(text: flightData['takeofftime'] ?? ''),
      'landingtime': TextEditingController(text: flightData['landingtime'] ?? ''),
      'flighttime': TextEditingController(text: flightData['flighttime'] ?? ''),
      'nopax': TextEditingController(text: flightData['nopax'] ?? ''),
      'paxw': TextEditingController(text: flightData['paxw'] ?? ''),
      'cargow': TextEditingController(text: flightData['cargow'] ?? ''),
      'fuelw': TextEditingController(text: flightData['fuelw'] ?? ''),
      'totalloadw': TextEditingController(text: flightData['totalloadw'] ?? ''),
      'cg': TextEditingController(text: flightData['cg'] ?? ''),
      'pilotsign': 1,
      'flightcategory': TextEditingController(text: flightData['flightcategory'] ?? ''),

    });
  }


  void addNewRow2(int tripNo2) {
    if (tripNo2 <= maxTripNo2) {
      rows2.add({
        'tripNo': TextEditingController(text: tripNo2.toString()),
        'pilot': TextEditingController(),
        'copilot': TextEditingController(),
        'from': TextEditingController(),
        'to': TextEditingController(),
        'takeofftime': TextEditingController(),
        'landingtime': TextEditingController(),
        'flighttime': TextEditingController(),
        'nopax': TextEditingController(),
        'paxw': TextEditingController(),
        'cargow': TextEditingController(),
        'fuelw': TextEditingController(),
        'totalloadw': TextEditingController(),
        'cg': TextEditingController(),
        'pilotsign': 0,  // Set to 0 (unchecked)
        'flightcategory': TextEditingController(),
      });
    }
  }



  void removeLastRow() {
    if (rows.length > 1) {
      rows.removeLast();
    }
  }
  void removeLastRow2() {
    if (rows2.length > 1) {
      rows2.removeLast();
    }
  }


  void printTableValues() {
    for (var row in rows) {
      print("Row values:================");
      row.forEach((key, controller) {
        print("$key: ${controller.text}");
      });
    }
  }


  // Future<void> formdata_pass_backend(String userID, String userToken) async {
  //   print("${AppUrls.formdata}?formid=$formId&userid=$userID&date=$currentDate");
  //   try {
  //     var response = await http.Client().get(
  //       Uri.parse("${AppUrls.formdata}?formid=$formId&userid=$userID&date=$currentDate&aircrafttype=$selectMaingroupId&aircraftreg=$selectedGroupId_id"),
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //         "Authorization": "Bearer $userToken"
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       final responseData = json.decode(response.body);
  //       print(responseData['data']['form_ref_no']);
  //       setState(() {
  //         commercial_flight_record_refno = responseData['data']['form_ref_no'];
  //       });
  //
  //
  //     } else {
  //       final responseData = json.decode(response.body);
  //       print(responseData['message']);
  //     }
  //   } catch (e) {
  //     log("Error in API $e");
  //   }
  // }


  Future<void> formdata_pass_backend(String userID, String userToken) async {
    print("${AppUrls.formdata}?formid=$formId&userid=$userID&date=$currentDate");
    try {
      var response = await http.Client().get(
        Uri.parse("${AppUrls.formdata}?formid=$formId&userid=$userID&date=$currentDate&aircrafttype=$selectMaingroupId&aircraftreg=$selectedGroupId_id"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      );

      if (response.statusCode == 200) {

        print('===');
        print(response.body);
        print('-0-0-');
        final responseData = json.decode(response.body);

        setState(() {
          commercial_flight_record_refno = responseData['data']['form_ref_no'];
        });




        List<dynamic> weights = responseData['data']['form_data']?['tableValues']?['weights'] ?? [];

        List<dynamic> flightdetails = responseData['data']['form_data']?['tableValues']?['flightdetails'] ?? [];

        setState(() {
          rows.clear();
          if (weights.isNotEmpty) {
            for (var weightData in weights) {
              addRowWithValues(weightData);
            }
          } else {
            addNewRow(1);
          }

          //row 2 section
          rows2.clear();
          if (flightdetails.isNotEmpty){
            for (var flightData in flightdetails){
              addRowWithValues2(flightData);
            }
          }else{
            addNewRow2(1);
          }

          _sheetNumber.text = responseData['data']['form_data']['sheetnumber'] ?? '';

          _formStatus = responseData['data']['form_status'];



          if (_formStatus == 'completed'){
            _totalflighttimevalue = responseData['data']['form_data']['totalflighttime'] ?? '';
            _startsengapuvalue =  responseData['data']['form_data']['startsengapu'] ?? '';
            _landingsvalue =  responseData['data']['form_data']['landings'] ?? '';
            _slingloadsvalue =  responseData['data']['form_data']['slingloads'] ?? '';
          }



        });
      }
    } catch (e) {
      log("Error in API $e");
      setState(() {
        rows.clear();
        addNewRow(1);
        rows2.clear();
        addNewRow2(1);
      });
    }
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
                                      padding: const EdgeInsets.all(15),
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
                                            'Commercial Flight Record'
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

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const SizedBox(width: 10),
                                          Text(
                                            commercial_flight_record_refno.toUpperCase(),
                                            style: TextStyle(
                                              fontFamily: AppFont.OutfitFont,
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
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
                                            currentDate.toUpperCase(),
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
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Aligns text to the start
                                    children: [
                                      Text(
                                        'Customer',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                          height:
                                              8), // Adds spacing between label and TextField
                                      TextField(
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                        ),

                                        controller: TextEditingController(text: fullName),
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
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 25),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'A/C. Registration',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      TextField(
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                        ),
                                        controller: TextEditingController(text: selectedGroupName),
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
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 25),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sect.4 Sheet No.',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: AppFont.OutfitFont,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      TextField(
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                        ),
                                        controller: _sheetNumber,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Weights',
                                        style: TextStyle(
                                          fontSize: 18,
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
                            SizedBox(height: 10),




                            Table(
                              border: TableBorder.all(color: Colors.black26),
                              columnWidths: const {
                                0: FixedColumnWidth(60.0),
                                1: FixedColumnWidth(115.0),
                                2: FixedColumnWidth(115.0),
                                3: FixedColumnWidth(115.0),
                                4: FixedColumnWidth(115.0),
                                5: FixedColumnWidth(115.0),
                                6: FixedColumnWidth(115.0),
                              },
                              children: [
                                // Header row
                                TableRow(
                                  decoration: BoxDecoration(  color: AppColor.primaryColor),
                                  children: [
                                    tableHeaderCell('Trip No'),
                                    tableHeaderCell('A/C. Empty Wt.'),
                                    tableHeaderCell('Crew Wt.'),
                                    tableHeaderCell('Total Operating Wt.'),
                                    tableHeaderCell('R.T.O.W'),
                                    tableHeaderCell('Load Wt. (Incl Fuel)'),
                                    tableHeaderCell('Useful Load'),
                                  ],
                                ),
                                // Dynamic rows
                                ...rows.map((row) {
                                  return TableRow(
                                    children: [
                                      tableDataCell(row['tripNo']!, isReadOnly: true),
                                      tableDataCell(row['emptyWt']!),
                                      tableDataCell(row['crewWt']!),
                                      tableDataCell(row['operatingWt']!),
                                      tableDataCell(row['rtow']!),
                                      tableDataCell(row['loadWt']!),
                                      tableDataCell(row['usefulLoad']!),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                            SizedBox(height: 15),
                            // Action buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [



                                if (_formStatus != 'completed') ...[


                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Are you sure?'),
                                          content: Text('Do you want to remove the row?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                // Close the dialog and do not remove the row
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Close the dialog and remove the row
                                                setState(() {
                                                  removeLastRow();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Yes'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.grey,
                                    padding: EdgeInsets.all(5),
                                    minimumSize: Size(15, 15),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),

                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {

                                    saveLocally();

                                    // setState(() {
                                    //   tableletestdata = '';
                                    // });
                                    //
                                    // List<Map<String, String>> table1Data = [];
                                    // for (var row in rows) {
                                    //   Map<String, String> rowData = {};
                                    //   row.forEach((key, controller) {
                                    //     rowData[key] = controller.text;
                                    //   });
                                    //   table1Data.add(rowData);
                                    // }
                                    // Map<String, dynamic> jsonResponse = {
                                    //   'weights': table1Data,
                                    // };
                                    // String tableDatejsonString = jsonEncode(jsonResponse);
                                    // print(tableDatejsonString);
                                    // setState(() {
                                    //   tableletestdata = tableDatejsonString;
                                    // });

                                    savethisFormData('partialy');


                                    if (rows.length < maxTripNo) {
                                      setState(() {
                                        addNewRow(rows.length + 1);
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: AppColor.primaryColor,
                                    padding: EdgeInsets.all(5),
                                    minimumSize: Size(15, 15),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),


                                ]




                              ],
                            ),












                            // Table(
                            //   border: TableBorder.all(color: Colors.black26),
                            //   columnWidths: const {
                            //     0: FixedColumnWidth(60.0),
                            //     1: FixedColumnWidth(115.0),
                            //     2: FixedColumnWidth(115.0),
                            //     3: FixedColumnWidth(115.0),
                            //     4: FixedColumnWidth(115.0),
                            //     5: FixedColumnWidth(115.0),
                            //     6: FixedColumnWidth(115.0),
                            //   },
                            //   children: [
                            //     TableRow(
                            //         decoration: BoxDecoration(  color: AppColor.primaryColor),
                            //         children: [
                            //           Container(
                            //             padding: const EdgeInsets.all(8.0),
                            //             decoration: BoxDecoration(
                            //               border: Border(
                            //                 right: BorderSide(
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //             child: Text(
                            //               'Trip No',
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontFamily: AppFont.OutfitFont,
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: const EdgeInsets.all(8.0),
                            //             decoration: BoxDecoration(
                            //               border: Border(
                            //                 right: BorderSide(
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //             child: Text(
                            //               'A/C. Empty Wt.',
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontFamily: AppFont.OutfitFont,
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Text(
                            //               'Crew Wt.',
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontFamily: AppFont.OutfitFont,
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: const EdgeInsets.all(8.0),
                            //             decoration: BoxDecoration(
                            //               border: Border(
                            //                 left: BorderSide(
                            //                   color: Colors.white,
                            //                 ),
                            //                 right: BorderSide(
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //             child: Text(
                            //               'Total Operating W.t',
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontFamily: AppFont.OutfitFont,
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Text(
                            //               'R.T.O.W'.toUpperCase(),
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontFamily: AppFont.OutfitFont,
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: const EdgeInsets.all(8.0),
                            //             decoration: BoxDecoration(
                            //               border: Border(
                            //                 right: BorderSide(
                            //                   color: Colors.white,
                            //                 ),
                            //                 left: BorderSide(
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //             child: Text(
                            //               'Load Wt. (Incl Fuel)',
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontFamily: AppFont.OutfitFont,
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: const EdgeInsets.all(8.0),
                            //             decoration: BoxDecoration(
                            //               border: Border(
                            //                 right: BorderSide(
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //             child: Text(
                            //               'Useful Load',
                            //               textAlign: TextAlign.center,
                            //               style: TextStyle(
                            //                 fontFamily: AppFont.OutfitFont,
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //           ),
                            //         ]),
                            //
                            //
                            //
                            //     TableRow(children: [
                            //       Padding(
                            //         padding: const EdgeInsets.all(0),
                            //         child: Container(
                            //           constraints: const BoxConstraints(
                            //             minHeight: 10.0,
                            //             maxHeight: 100.0,
                            //           ),
                            //           child: SingleChildScrollView(
                            //             child: TextField(
                            //               controller:
                            //                   TextEditingController(text: "1"),
                            //               enabled: false, // Disables editing
                            //               style: const TextStyle(
                            //                 fontSize: 16.0,
                            //                 color: AppColor.textColor,
                            //               ),
                            //               scrollPhysics:
                            //                   const NeverScrollableScrollPhysics(),
                            //               decoration: const InputDecoration(
                            //                 border: InputBorder.none,
                            //                 contentPadding:
                            //                     EdgeInsets.symmetric(
                            //                   horizontal: 10.0,
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(0),
                            //         child: Container(
                            //           constraints: const BoxConstraints(
                            //             minHeight: 10.0,
                            //             maxHeight: 100.0,
                            //           ),
                            //           child: const SingleChildScrollView(
                            //             child: TextField(
                            //               style: TextStyle(
                            //                   fontSize: 16.0,
                            //                   color: AppColor.textColor),
                            //               scrollPhysics:
                            //                   NeverScrollableScrollPhysics(),
                            //               decoration: InputDecoration(
                            //                 border: InputBorder.none,
                            //                 contentPadding:
                            //                     EdgeInsets.symmetric(
                            //                         horizontal: 10.0),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(0),
                            //         child: Container(
                            //           constraints: const BoxConstraints(
                            //             minHeight: 10.0,
                            //             maxHeight: 100.0,
                            //           ),
                            //           child: const SingleChildScrollView(
                            //             child: TextField(
                            //               style: TextStyle(
                            //                   fontSize: 16.0,
                            //                   color: AppColor.textColor),
                            //               scrollPhysics:
                            //                   NeverScrollableScrollPhysics(),
                            //               decoration: InputDecoration(
                            //                 border: InputBorder.none,
                            //                 contentPadding:
                            //                     EdgeInsets.symmetric(
                            //                         horizontal: 10.0),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(0),
                            //         child: Container(
                            //           constraints: const BoxConstraints(
                            //             minHeight: 10.0,
                            //             maxHeight: 100.0,
                            //           ),
                            //           child: const SingleChildScrollView(
                            //             child: TextField(
                            //               style: TextStyle(
                            //                   fontSize: 16.0,
                            //                   color: AppColor.textColor),
                            //               scrollPhysics:
                            //                   NeverScrollableScrollPhysics(),
                            //               decoration: InputDecoration(
                            //                 border: InputBorder.none,
                            //                 contentPadding:
                            //                     EdgeInsets.symmetric(
                            //                         horizontal: 10.0),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(0),
                            //         child: Container(
                            //           constraints: const BoxConstraints(
                            //             minHeight: 10.0,
                            //             maxHeight: 100.0,
                            //           ),
                            //           child: const SingleChildScrollView(
                            //             child: TextField(
                            //               style: TextStyle(
                            //                   fontSize: 16.0,
                            //                   color: AppColor.textColor),
                            //               scrollPhysics:
                            //                   NeverScrollableScrollPhysics(),
                            //               decoration: InputDecoration(
                            //                 border: InputBorder.none,
                            //                 contentPadding:
                            //                     EdgeInsets.symmetric(
                            //                         horizontal: 10.0),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(0),
                            //         child: Container(
                            //           constraints: const BoxConstraints(
                            //             minHeight: 10.0,
                            //             maxHeight: 100.0,
                            //           ),
                            //           child: const SingleChildScrollView(
                            //             child: TextField(
                            //               style: TextStyle(
                            //                   fontSize: 16.0,
                            //                   color: AppColor.textColor),
                            //               scrollPhysics:
                            //                   NeverScrollableScrollPhysics(),
                            //               decoration: InputDecoration(
                            //                 border: InputBorder.none,
                            //                 contentPadding:
                            //                     EdgeInsets.symmetric(
                            //                         horizontal: 10.0),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.all(0),
                            //         child: Container(
                            //           constraints: const BoxConstraints(
                            //             minHeight: 10.0,
                            //             maxHeight: 100.0,
                            //           ),
                            //           child: const SingleChildScrollView(
                            //             child: TextField(
                            //               style: TextStyle(
                            //                   fontSize: 16.0,
                            //                   color: AppColor.textColor),
                            //               scrollPhysics:
                            //                   NeverScrollableScrollPhysics(),
                            //               decoration: InputDecoration(
                            //                 border: InputBorder.none,
                            //                 contentPadding:
                            //                     EdgeInsets.symmetric(
                            //                         horizontal: 10.0),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ]),
                            //
                            //
                            //
                            //   ],
                            // ),
                            //
                            // SizedBox(height: 15),
                            //
                            //
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     ElevatedButton(
                            //       onPressed: () {
                            //         // Add your action for cross icon button
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //         shape: CircleBorder(),
                            //         backgroundColor: Colors.grey,
                            //         padding: EdgeInsets.all(5),
                            //         minimumSize: Size(15, 15),
                            //       ),
                            //       child: Icon(
                            //         Icons.close,
                            //         color: Colors.white,
                            //         size: 13, // Set icon size
                            //       ),
                            //     ),
                            //
                            //     ElevatedButton(
                            //       onPressed: () {
                            //
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //         shape: CircleBorder(),
                            //         backgroundColor: AppColor.primaryColor,
                            //         padding: EdgeInsets.all(5),
                            //         minimumSize: Size(15, 15),
                            //       ),
                            //       child: Icon(
                            //         Icons.check,
                            //         color: Colors.white,
                            //         size: 13, // Set icon size
                            //       ),
                            //     ),
                            //   ],
                            // ),










































                            const SizedBox(height: 20),
                            const Divider(
                              height: 20,
                              thickness: 0.3,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 20),


                            Center(
                              child: Container(
                                child: SingleChildScrollView(
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    child:


                                    Table(
                                      border: TableBorder.all(color: Colors.black26),
                                      columnWidths: const {
                                        0: FixedColumnWidth(70.0),
                                        1: FixedColumnWidth(120.0),
                                        2: FixedColumnWidth(120.0),
                                        3: FixedColumnWidth(140.0),
                                        4: FixedColumnWidth(140.0),
                                        5: FixedColumnWidth(140.0),
                                        6: FixedColumnWidth(140.0),
                                        7: FixedColumnWidth(140.0),
                                        8: FixedColumnWidth(150.0),
                                        9: FixedColumnWidth(100.0),
                                        10: FixedColumnWidth(90.0),
                                        11: FixedColumnWidth(90.0),
                                        12: FixedColumnWidth(90.0),
                                        13: FixedColumnWidth(120.0),
                                        14: FixedColumnWidth(140.0),
                                        15: FixedColumnWidth(140.0),

                                      },
                                      children: [
                                        // Header row
                                        TableRow(
                                          decoration: BoxDecoration(  color: AppColor.primaryColor),
                                          children: [
                                            tableHeaderCell2('Trip No'),
                                            tableHeaderCell2('Pilot'),
                                            tableHeaderCell2('Co-Pilot'),
                                            tableHeaderCell2('From'),
                                            tableHeaderCell2('To'),
                                            tableHeaderCell2('Takeoff Time'),
                                            tableHeaderCell2('Landing Time'),
                                            tableHeaderCell2('Flight Time'),
                                            tableHeaderCell2('No.PAX'),
                                            tableHeaderCell2('PAX [w]'),
                                            tableHeaderCell2('Cargo [w]'),
                                            tableHeaderCell2('Fuel [w]'),
                                            tableHeaderCell2('Total Load [w]'),
                                            tableHeaderCell2('CG'),
                                            tableHeaderCell2('Pilot Sign.'),
                                            tableHeaderCell2('Flight Category'),
                                          ],
                                        ),
                                        // Dynamic rows
                                        ...rows2.map((row) {
                                          return TableRow(
                                            // children: [
                                            //   tableDataCell2(row['tripNo']!, isReadOnly: true),
                                            //   tableDataCell2(row['pilot']!),
                                            //   tableDataCell2(row['copilot']!),
                                            //   tableDataCell2(row['from']!),
                                            //   tableDataCell2(row['to']!),
                                            //   tableDataCell2(row['takeofftime']!, isTimefield: true ),
                                            //   tableDataCell2(row['landingtime']!, isTimefield: true ),
                                            //   tableDataCell2(row['flighttime']!, isTimefield: true ),
                                            //   tableDataCell2(row['nopax']!),
                                            //   tableDataCell2(row['paxw']!),
                                            //   tableDataCell2(row['cargow']!),
                                            //   tableDataCell2(row['fuelw']!),
                                            //   tableDataCell2(row['totalloadw']!),
                                            //   tableDataCell2(row['cg']!),
                                            //   tableDataCell2(row['pilotsign']!, isSign:true),
                                            //   tableDataCell2(row['flightcategory']!),
                                            // ],



                                            children: [
                                              tableDataCell2(row['tripNo']!, isReadOnly: true),
                                              tableDataCell2(row['pilot']!),
                                              tableDataCell2(row['copilot']!),
                                              tableDataCell2(row['from']!),
                                              tableDataCell2(row['to']!),
                                              tableDataCell2(row['takeofftime']!, isTimefield: true),
                                              tableDataCell2(row['landingtime']!, isTimefield: true),
                                              tableDataCell2(row['flighttime']!, isTimefield: true),
                                              tableDataCell2(row['nopax']!),
                                              tableDataCell2(row['paxw']!),
                                              tableDataCell2(row['cargow']!),
                                              tableDataCell2(row['fuelw']!),
                                              tableDataCell2(row['totalloadw']!),
                                              tableDataCell2(row['cg']!),
                                              tableDataCell2(row['pilotsign'], isSign: true, rowIndex: rows2.indexOf(row)),
                                              tableDataCell2(row['flightcategory']!),
                                            ],






                                          );
                                        }).toList(),
                                      ],
                                    ),



                                ),
                              ),
                            ),





                            SizedBox(height: 15),
                            // Action buttons









                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [


                                if (_formStatus != 'completed') ...[


                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Are you sure?'),
                                          content: Text('Do you want to remove the row?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                // Close the dialog and do not remove the row
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Close the dialog and remove the row
                                                setState(() {
                                                  removeLastRow2();
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Yes'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.grey,
                                    padding: EdgeInsets.all(5),
                                    minimumSize: Size(15, 15),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),

                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {

                                    saveLocally();


                                    savethisFormData('partialy');

                                    if (rows2.length < maxTripNo2) {
                                      setState(() {
                                        addNewRow2(rows2.length + 1);
                                      });
                                    }


                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    backgroundColor: AppColor.primaryColor,
                                    padding: EdgeInsets.all(5),
                                    minimumSize: Size(15, 15),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),

                                ]
                                // ElevatedButton(
                                //   onPressed: printTableValues,
                                //
                                // child: Icon(
                                //   Icons.check,
                                //   color: Colors.white,
                                //   size: 13,
                                // ),)

                              ],
                            ),






                            // Center(
                            //   child: Container(
                            //     child: SingleChildScrollView(
                            //       primary: false,
                            //       scrollDirection: Axis.horizontal,
                            //       child:
                            //           Table(
                            //         border: TableBorder.all(color: Colors.black26),
                            //         columnWidths: const {
                            //           0: FixedColumnWidth(70.0),
                            //           1: FixedColumnWidth(120.0),
                            //           2: FixedColumnWidth(120.0),
                            //           3: FixedColumnWidth(140.0),
                            //           4: FixedColumnWidth(140.0),
                            //           5: FixedColumnWidth(140.0),
                            //           6: FixedColumnWidth(140.0),
                            //           7: FixedColumnWidth(140.0),
                            //           8: FixedColumnWidth(150.0),
                            //           9: FixedColumnWidth(100.0),
                            //           10: FixedColumnWidth(90.0),
                            //           11: FixedColumnWidth(90.0),
                            //           12: FixedColumnWidth(90.0),
                            //           13: FixedColumnWidth(120.0),
                            //           14: FixedColumnWidth(140.0),
                            //           15: FixedColumnWidth(140.0),
                            //
                            //         },
                            //         children: [
                            //           TableRow(
                            //               decoration: BoxDecoration(
                            //                   color: AppColor.primaryColor),
                            //               children: [
                            //
                            //             Container(
                            //               padding: const EdgeInsets.all(8.0),
                            //               decoration: BoxDecoration(
                            //                 border: Border(
                            //                   right: BorderSide(
                            //                     color: Colors.white,
                            //                   ),
                            //                 ),
                            //               ),
                            //               child: Text(
                            //                 'Trip No',
                            //                 textAlign: TextAlign.center,
                            //                 style: TextStyle(
                            //                   fontFamily: AppFont.OutfitFont,
                            //                   color: Colors.white,
                            //                   fontSize: 16,
                            //                   fontWeight: FontWeight.w600,
                            //                 ),
                            //               ),
                            //             ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Pilot',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Co-Pilot',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'From',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'To',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Takeoff Time',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Landing Time',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Flight Time',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'No.PAX',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'PAX [W]',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Cargo [W]',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Fuel [W]',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Total Load [W]',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'CG',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Pilots Sign.',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //                 Container(
                            //                   padding: const EdgeInsets.all(8.0),
                            //                   decoration: BoxDecoration(
                            //                     border: Border(
                            //                       right: BorderSide(
                            //                         color: Colors.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   child: Text(
                            //                     'Flight Category',
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                       fontFamily: AppFont.OutfitFont,
                            //                       color: Colors.white,
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                 ),
                            //
                            //
                            //               ]),
                            //
                            //           TableRow(children: [
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.all(0),
                            //               child: Container(
                            //                 constraints: const BoxConstraints(
                            //                   minHeight: 10.0,
                            //                   maxHeight: 100.0,
                            //                 ),
                            //                 child: const SingleChildScrollView(
                            //                   child: TextField(
                            //                     style: TextStyle(
                            //                         fontSize: 16.0,
                            //                         color: AppColor.textColor),
                            //                     scrollPhysics:
                            //                     NeverScrollableScrollPhysics(),
                            //                     decoration: InputDecoration(
                            //                       border: InputBorder.none,
                            //                       contentPadding:
                            //                       EdgeInsets.symmetric(
                            //                           horizontal: 10.0),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //
                            //           ]),
                            //
                            //
                            //         ],
                            //       ),
                            //
                            //
                            //
                            //
                            //     ),
                            //   ),
                            // ),

                            // SizedBox(height: 15),



                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     ElevatedButton(
                            //       onPressed: () {
                            //         // Add your action for cross icon button
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //         shape: CircleBorder(),
                            //         backgroundColor: Colors.grey,
                            //         padding: EdgeInsets.all(5),
                            //         minimumSize: Size(15, 15),
                            //       ),
                            //       child: Icon(
                            //         Icons.close,
                            //         color: Colors.white,
                            //         size: 13, // Set icon size
                            //       ),
                            //     ),
                            //
                            //     ElevatedButton(
                            //       onPressed: () {
                            //
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //         shape: CircleBorder(),
                            //         backgroundColor: AppColor.primaryColor,
                            //         padding: EdgeInsets.all(5),
                            //         minimumSize: Size(15, 15),
                            //       ),
                            //       child: Icon(
                            //         Icons.check,
                            //         color: Colors.white,
                            //         size: 13, // Set icon size
                            //       ),
                            //     ),
                            //   ],
                            // ),






                            const SizedBox(height: 40.00),



                            if (_formStatus != 'completed') ...[
                              SizedBox(
                                width: 150.00,
                                child: ElevatedButton(
                                  onPressed: () {

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Confirmation Required'),
                                          content: Text('Would you like to complete and submit your data?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('No'),
                                            ),
                                            TextButton(
                                              onPressed: () {

                                                Navigator.of(context).pop();
                                                _formtabledata();
                                                // _showChangePasswordDialog(context);
                                              },
                                              child: Text('Yes'),
                                            ),
                                          ],
                                        );
                                      },
                                    );


                                    // _showChangePasswordDialog( context);



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
                                    'Continue',
                                    style: TextStyle(
                                      fontFamily: AppFont.OutfitFont,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              ],


                            //in case the form status is completed time it will be show an the modal items:
                            if (_formStatus == 'completed') ...[

                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Total Flight Time : ',
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(_totalflighttimevalue,
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),),
                                      ],
                                    ),
                                    const SizedBox(height: 10), // Space between rows
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Starts ENG/APU : ',
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(_startsengapuvalue,
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Landings : ',
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(_landingsvalue,
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Sling Loads : ',
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text(_slingloadsvalue,
                                          style: TextStyle(
                                            fontFamily: AppFont.OutfitFont,
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],









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




  // void _formtabledata() {
  //
  //   setState(() {
  //     formattedTotalFlightTime = '';
  //   });
  //
  //   List<Map<String, String>> table1Data = [];
  //   List<Map<String, String>> table2Data = [];
  //   Duration totalFlightTime = Duration();
  //
  //   for (var row in rows) {
  //     Map<String, String> rowData = {};
  //     row.forEach((key, controller) {
  //       rowData[key] = controller.text;
  //     });
  //     table1Data.add(rowData);
  //   }
  //   for (var row in rows2) {
  //     Map<String, String> rowData = {};
  //     row.forEach((key, controller) {
  //       rowData[key] = controller.text;
  //     });
  //     table2Data.add(rowData);
  //
  //     String flightTimeStr = rowData['flighttime'] ?? '00:00';
  //     Duration flightDuration = _parseTimeToDuration(flightTimeStr);
  //     totalFlightTime += flightDuration;
  //   }
  //   setState(() {
  //     formattedTotalFlightTime =  _formatDuration(totalFlightTime);
  //   });
  //
  //
  //   Map<String, dynamic> jsonResponse = {
  //     'weights': table1Data,
  //     'flightdetails': table2Data,
  //     'totalFlightTime': formattedTotalFlightTime,
  //   };
  //
  //   String tableDatejsonString = jsonEncode(jsonResponse);
  //   print(tableDatejsonString);
  //
  //   _showChangePasswordDialog( context);
  //
  //
  // }



  void saveLocally() {
    setState(() {
      tableletestdata = '';
    });

    List<Map<String, String>> table1Data = [];
    List<Map<String, String>> table2Data = [];

    bool isAnyPilotNotSignedIn = false;

    // Process table1Data and skip rows with empty data
    for (var row in rows) {
      Map<String, String> rowData = {};
      bool isEmptyRow = true;

      row.forEach((key, controller) {
        rowData[key] = controller.text;
        if (controller.text.isNotEmpty) {
          isEmptyRow = false;
        }
      });

      if (!isEmptyRow) {
        table1Data.add(rowData);
      }
    }

    // Process table2Data and skip rows with empty data
    for (var row in rows2) {
      Map<String, String> rowData = {};
      bool isEmptyRow = true;

      row.forEach((key, controller) {
        if (key == 'pilotsign') {
          rowData[key] = row[key] == 1 ? '1' : '0';
          if (row[key] == 0) {
            isAnyPilotNotSignedIn = true;
          }
        } else {
          rowData[key] = controller.text;
        }

        // Check if there's at least one non-empty field in the row
        if (key != 'pilotsign' && controller.text.isNotEmpty) {
          isEmptyRow = false;
        }
      });

      if (!isEmptyRow) {
        table2Data.add(rowData);
      }
    }

    Map<String, dynamic> jsonResponse = {
      'weights': table1Data,
      'flightdetails': table2Data,
    };

    String tableDatejsonString = jsonEncode(jsonResponse);
    print(tableDatejsonString);

    if (isAnyPilotNotSignedIn) {
      EasyLoading.showInfo('Please sign in to continue');
    } else {
      setState(() {
        tableletestdata = tableDatejsonString;
      });
    }
  }


  // void saveLocaly(){
  //
  //   setState(() {
  //     tableletestdata = '';
  //   });
  //
  //   List<Map<String, String>> table1Data = [];
  //   List<Map<String, String>> table2Data = [];
  //
  //   bool isAnyPilotNotSignedIn = false;
  //
  //
  //   for (var row in rows) {
  //     Map<String, String> rowData = {};
  //     row.forEach((key, controller) {
  //       rowData[key] = controller.text;
  //     });
  //     table1Data.add(rowData);
  //   }
  //
  //   for (var row in rows2) {
  //     Map<String, String> rowData = {};
  //     row.forEach((key, controller) {
  //       if (key == 'pilotsign') {
  //         rowData[key] = row[key] == 1 ? '1' : '0';
  //         if (row[key] == 0) {
  //           isAnyPilotNotSignedIn = true;
  //         }
  //       } else {
  //         rowData[key] = controller.text;
  //       }
  //     });
  //     table2Data.add(rowData);
  //   }
  //
  //
  //   Map<String, dynamic> jsonResponse = {
  //     'weights': table1Data,
  //     'flightdetails': table2Data,
  //   };
  //
  //
  //   String tableDatejsonString = jsonEncode(jsonResponse);
  //   print(tableDatejsonString);
  //
  //
  //   if (isAnyPilotNotSignedIn) {
  //     EasyLoading.showInfo( 'Please sign in to continue');
  //   } else {
  //     setState(() {
  //       tableletestdata = tableDatejsonString;
  //     });
  //
  //
  //   }
  //
  // }
  //



  void _formtabledata() {
    setState(() {
      formattedTotalFlightTime = '';
    });

    List<Map<String, String>> table1Data = [];
    List<Map<String, String>> table2Data = [];
    Duration totalFlightTime = Duration();
    bool isAnyPilotNotSignedIn = false;

    for (var row in rows) {
      Map<String, String> rowData = {};
      row.forEach((key, controller) {
        rowData[key] = controller.text;
      });
      table1Data.add(rowData);
    }

    for (var row in rows2) {
      Map<String, String> rowData = {};
      row.forEach((key, controller) {
        if (key == 'pilotsign') {
          rowData[key] = row[key] == 1 ? '1' : '0';
          if (row[key] == 0) {
            isAnyPilotNotSignedIn = true;
          }
        } else {
          rowData[key] = controller.text;
        }
      });
      table2Data.add(rowData);

      String flightTimeStr = rowData['flighttime'] ?? '00:00';
      Duration flightDuration = _parseTimeToDuration(flightTimeStr);
      totalFlightTime += flightDuration;
    }

    setState(() {
      formattedTotalFlightTime = _formatDuration(totalFlightTime);
    });

    Map<String, dynamic> jsonResponse = {
      'weights': table1Data,
      'flightdetails': table2Data,
    };

    String tableDatejsonString = jsonEncode(jsonResponse);
    print(tableDatejsonString);


    if (isAnyPilotNotSignedIn) {
      EasyLoading.showInfo( 'Please sign in to continue');
    } else {
      setState(() {
        tableletestdata = tableDatejsonString;
      });

      _showChangePasswordDialog(context);
    }

  }


  Duration _parseTimeToDuration(String timeStr) {
    final timeParts = timeStr.split(':');
    if (timeParts.length == 2) {
      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);
      return Duration(hours: hours, minutes: minutes);
    }
    return Duration();
  }

// Helper function to format Duration to a readable string (hh:mm)
  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }






  void _showChangePasswordDialog(BuildContext context) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.05), // Transparent background
            ),
          ),
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  width:400,
                  // height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(30),
                  child: ListView(
                      shrinkWrap: true,
                      children:[ Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: AppFont.OutfitFont,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                onPressed: () {

                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            'Total Flight Time:',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFont.OutfitFont,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            style: TextStyle(
                              color: AppColor.textColor,
                            ),
                            readOnly: true,
                            controller: TextEditingController(text: formattedTotalFlightTime),
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
                          const SizedBox(height: 30),
                          Text(
                            'Starts ENG/APU',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFont.OutfitFont,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            style: TextStyle(
                              color: AppColor.textColor,
                            ),
                            controller: _startsengapu,
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
                          const SizedBox(height: 30),

                          // New Password
                          Text(
                            'Landings',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFont.OutfitFont,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            style: TextStyle(
                              color: AppColor.textColor,
                            ),
                            controller: _landings,

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
                          const SizedBox(height: 30),

                          // Confirm Password
                          Text(
                            'Sling Loads',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppFont.OutfitFont,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            style: TextStyle(
                              color: AppColor.textColor,
                            ),
                            controller: _slingloads,
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
                          const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,

                            child: ElevatedButton(

                              onPressed: () {

                                savethisFormData('completed');


                                // updatePassword();
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0x74FFFFFF),
                                backgroundColor: const Color(0xFFAA182C),
                                padding: const EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Finish',
                                style: TextStyle(
                                  fontFamily: AppFont.OutfitFont,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ]
                  ),
                );
              },
            ),
          ),
        ]);
      },
    );
  }

  Widget tableHeaderCell(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget tableDataCell(TextEditingController controller, {bool isReadOnly = false}) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        constraints: const BoxConstraints(minHeight: 10.0, maxHeight: 100.0),
        child: SingleChildScrollView(
          child: TextField(
            controller: controller,
            readOnly: isReadOnly,
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ),
        ),
      ),
    );
  }






  Widget tableHeaderCell2(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Widget tableDataCell2(TextEditingController controller ,{bool isReadOnly = false,   bool isTimefield = false}) {
  //   // print(textis);
  //
  //   return Padding(
  //     padding: const EdgeInsets.all(0),
  //     child: Container(
  //       constraints: const BoxConstraints(minHeight: 10.0, maxHeight: 100.0),
  //       child: SingleChildScrollView(
  //         child: TextField(
  //           controller: controller,
  //           readOnly: isReadOnly,
  //           style: const TextStyle(fontSize: 16.0, color: Colors.black),
  //           decoration: const InputDecoration(
  //
  //             border: InputBorder.none,
  //             contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  //old code :

  // Widget tableDataCell2(TextEditingController controller, {bool isReadOnly = false, bool isTimefield = false, bool isSign = false}) {
  //   return Padding(
  //     padding: const EdgeInsets.all(0),
  //     child: Container(
  //       constraints: const BoxConstraints(minHeight: 10.0, maxHeight: 100.0),
  //       child: SingleChildScrollView(
  //         child:
  //         TextField(
  //           controller: controller,
  //           readOnly: isReadOnly,
  //           style: const TextStyle(fontSize: 16.0, color: Colors.black),
  //           decoration: const InputDecoration(
  //             border: InputBorder.none,
  //             contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
  //           ),
  //           onTap: isTimefield ? () async {
  //             TimeOfDay? pickedTime = await showTimePicker(
  //               context: context,
  //               initialTime: TimeOfDay.now(),
  //               builder: (context, child) {
  //                 return MediaQuery(
  //                   data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), // Force 24-hour format
  //                   child: child!,
  //                 );
  //               },
  //             );
  //
  //             if (pickedTime != null) {
  //               // Format the picked time in 24-hour format
  //               String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
  //               controller.text = formattedTime;
  //             }
  //           } : null,
  //         ),
  //
  //       ),
  //     ),
  //   );
  // }
  //




  Widget tableDataCell2(
      dynamic value, {
        bool isReadOnly = false,
        bool isTimefield = false,
        bool isSign = false,
        int? rowIndex,
      }) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        constraints: const BoxConstraints(minHeight: 10.0, maxHeight: 100.0),
        child: SingleChildScrollView(
          child: isSign
              ? Checkbox(
            value: value == 1, // Check if value is 1 (true)
            activeColor: AppColor.primaryColor,
            checkColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            onChanged: (bool? newValue) {
              setState(() {
                if (rowIndex != null) {
                  // Update the value to 1 (checked) or 0 (unchecked)
                  rows2[rowIndex]['pilotsign'] = newValue == true ? 1 : 0;
                }
              });
            },
          )
              : TextField(
            controller: value as TextEditingController,
            readOnly: isReadOnly,
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            ),
            onTap: isTimefield
                ? () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                    child: child!,
                  );
                },
              );
              if (pickedTime != null) {
                String formattedTime = '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
                (value as TextEditingController).text = formattedTime;
              }
            }
                : null,
          ),
        ),
      ),
    );
  }



//save funtion



  Future<void> savethisFormData(String status) async {

    var aircraft = {
      "aircraftId": selectMaingroupId,
      "aircraftType": selectMaingroup,
      "aircraftRegId": selectedGroupId_id,
      "aircraftRegistration": selectedGroupName
    };

    var data = {
      "customer":fullName,
      "aircraft": aircraft,
      "sheetnumber":_sheetNumber.text,
      "tableValues": tableletestdata,
      "totalflighttime": formattedTotalFlightTime,
      "startsengapu": _startsengapu.text,
      "landings" : _landings.text,
      "slingloads":_slingloads.text,

    };


    try {
      var response = await http.Client().post(
        Uri.parse(
            "${AppUrls.formdata}?formid=$formId&formrefno=$commercial_flight_record_refno"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
        body: jsonEncode({
          "data": data,
          "status" : status
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
      } else {
        //
      }
    } catch (e) {
      // EasyLoading.dismiss();
      // if (e.toString().contains('Connection refused')) {
      //   EasyLoading.showToast(
      //       'You are in offline mode!\nPlease check your network connection.');
      // } else {
      //   EasyLoading.showToast(
      //       'Something went wrong!\nPlease check again later.');
      // }

      log("Error in API $e");
    }










  }



}



