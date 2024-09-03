import 'dart:convert';
import 'dart:developer';

import 'package:falcon_aviation/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_font.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_urls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _passwordfocusNode = FocusNode();
  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _isCompleted = false;
  bool _showGroupDropdown = false;
  bool _showSubGroupDropdown = false;
  bool _isPressed = false;
  bool _showLoginButton = false;

  List<String> grouplist = [
    'Select a Aircraft Type',
    'AW189',
    'Bell 412',
    'AT-123'
  ];

  List<String> subgrouplist = [
    'Select a Parent Aircraft Type',
    'A6-FHD',
    'A6-FHC',
    'A6-FFA'
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _emailSearch(String email) async {
    setState(() {
      _isLoading = true;
      _isCompleted = false;
    });
    // print(email);
    // try {
    //   var response = await http.Client().get(
    //     Uri.parse("${AppUrls.emailcheck}$email"),
    //     headers: {
    //       "Content-Type": "application/json",
    //       "Accept": "application/json",
    //     },
    //
    //   );
    //   // log("API>>>URL>>${AppUrls.emailcheck}$email}<<<REQ>>>${response.body}");
    //   if (response.statusCode == 200) {
    //     final responseData = json.decode(response.body);
    //     print(responseData);
    //
    //
    //   } else {
    //     final responseData = json.decode(response.body);
    //     EasyLoading.showError(responseData['message']);
    //
    //
    //   }
    // } catch (e) {
    //   log("Error in API $e");
    //
    // }




    await Future.delayed(Duration(seconds: 3));

    print('hi');

    setState(() {
      _isLoading = false;
      _isCompleted = true;
      _showGroupDropdown = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dropdowngroupValue = grouplist.first;
    String dropdownsubgroupValue = subgrouplist.first;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            WhiteBackground,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset(
                  RedBlackLogo,
                  width: 180,
                  height: 100,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 180.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email or Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppFont.OutfitFont,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          )),
                      SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {

                          if (_emailController.text.toString() == "") {
                            EasyLoading.showToast("Email address is required.");
                          }else{
                            _emailSearch(_emailController.text);
                          }

                        },
                        decoration: InputDecoration(
                          hintText: 'Email or Username',
                          hintStyle: TextStyle(color: Color(0xFFCACAC9)),
                          filled: true, // Enables the background fill
                          fillColor: Colors
                              .white, // Sets the background color to white
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color(0xFF626262)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          suffixIcon: _isLoading
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: CircularProgressIndicator(
                                      color: AppColor.primaryColor,
                                      backgroundColor: Colors.white,
                                      strokeWidth: 3.0,
                                    ),
                                  ),
                                )
                              : _isCompleted
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                    )
                                  : null,
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimatedOpacity(
                        opacity: _showGroupDropdown ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: AnimatedSlide(
                          offset: _showGroupDropdown
                              ? Offset(0, 0)
                              : Offset(0, 0.2),
                          duration: Duration(milliseconds: 500),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aircraft Type',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: AppFont.OutfitFont,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                value: dropdowngroupValue,
                                items: grouplist.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdowngroupValue = newValue!;
                                    _showSubGroupDropdown = true;
                                    print(dropdowngroupValue);
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Select a Aircraft Type',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFCACAC9)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFCACAC9)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFCACAC9)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFF626262)),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Color(0xFFCACAC9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimatedOpacity(
                        opacity: _showSubGroupDropdown ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: AnimatedSlide(
                          offset: _showSubGroupDropdown
                              ? Offset(0, 0)
                              : Offset(0, 0.2),
                          duration: Duration(milliseconds: 500),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parent Aircraft Type',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: AppFont.OutfitFont,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                value: dropdownsubgroupValue,
                                items: subgrouplist.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownsubgroupValue = newValue!;
                                    _showLoginButton = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Select a Parent Aircraft Type',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFCACAC9)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFCACAC9)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFCACAC9)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFF626262)),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Color(0xFFCACAC9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimatedOpacity(
                        opacity: _showLoginButton ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: AnimatedSlide(
                          offset:
                              _showLoginButton ? Offset(0, 0) : Offset(0, 0.2),
                          duration: Duration(milliseconds: 500),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFont.OutfitFont,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(height: 10),
                              TextField(
                                controller: _passwordcontroller,
                                focusNode: _passwordfocusNode,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.done,
                                onSubmitted: (value) {},
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFCACAC9)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFCACAC9)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFF626262)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Color(0xFFCACAC9)),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscurePassword =
                                            !_obscurePassword; // Toggle password visibility
                                      });
                                    },
                                    child: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Color(0xFF626262),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
                              Align(
                                alignment: Alignment
                                    .centerRight, // Align text to the right
                                child: Text(
                                  'Recover Password?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: AppFont.OutfitFont,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isPressed = !_isPressed;

                                    Navigator.pushNamed(
                                      context,
                                      "/home",
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isPressed
                                      ? AppColor.primaryColor
                                      : Colors.white,
                                  minimumSize: Size(double.infinity, 55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        color: Color(0xFF2D2A26), width: 1),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text('Login',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: AppFont.OutfitFont,
                                      color: _isPressed
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
