import 'dart:convert';
import 'dart:developer';

import 'package:falcon_aviation/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_font.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_sp.dart';
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

  String userToken = "";
  String _userEmail = "";

  String selectedGroupis = '';
  String selectedSubGroupis = '';

  Map<String, String> groupMap = {};
  Map<String, String> subgroupMap = {};

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  //email Fetching API
  void _emailSearch(String email) async {
    setState(() {
      _isLoading = true;
      _isCompleted = false;
    });

    try {
      var response = await http.Client().get(
        Uri.parse("${AppUrls.emailcheck}$email"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        userToken = responseData['token'];
        _userEmail = email;

        AppSp().setToken(responseData['token']);

        Map<String, String> fetchedGroups = {
          '0': 'Select Aircraft Type',
          for (var group in responseData['data']['groups'])
            group['id'].toString(): group['name'].toString()
        };

        setState(() {
          groupMap = fetchedGroups;
          _isLoading = false;
          _isCompleted = true;
          _showGroupDropdown = true;
        });
      } else {
        final responseData = json.decode(response.body);
        EasyLoading.showError(responseData['message']);
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      log("Error in API $e");
      EasyLoading.showError("Error in API $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  //Subgroup fetching API
  void _fetchsubgroup(String groupId) async {
    try {
      var response = await http.Client().get(
        Uri.parse("${AppUrls.groups}$groupId/subgroups/"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        Map<String, String> fetchedSubgroups = {
          '0': 'Select a Parent Aircraft Type',
          for (var subgroup in responseData)
            subgroup['id'].toString(): subgroup['group_name'].toString()
        };

        setState(() {
          subgroupMap = fetchedSubgroups;
          _showSubGroupDropdown = true;
        });
      } else {
        EasyLoading.showError("Failed to load subgroups");
      }
    } catch (e) {
      log("Error in API $e");
      EasyLoading.showError("Error in API $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Login API
  void _loginAuthenticate(String password, String selectedSubGroupId) async {
    print(password);
    print(selectedSubGroupId);
    print(_userEmail);

    try {
      var response = await http.Client().post(
        Uri.parse("${AppUrls.login}"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
        body: jsonEncode({
          "email": _userEmail,
          "group": selectedSubGroupId,
          "password": password
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        EasyLoading.showSuccess(responseData['message']);
        AppSp().setIsLogged(true);
        Navigator.pushNamed(
          context,
          "/home",
        );
      } else {
        final responseData = json.decode(response.body);
        print(responseData['message']);
        EasyLoading.showError(responseData['message']);

        setState(() {
          _passwordcontroller.text = '';
        });
      }
    } catch (e) {
      log("Error in API $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedGroupId =
        groupMap.keys.isNotEmpty ? groupMap.keys.first : 'Select Group';
    String dropdownGroupValue = groupMap[selectedGroupId] ?? 'Select Group';

    String selectedSubGroupId = subgroupMap.keys.isNotEmpty
        ? subgroupMap.keys.first
        : 'Select a Subgroup';
    String dropdownSubGroupValue =
        subgroupMap[selectedSubGroupId] ?? 'Select a Subgroup';

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
                          } else {
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
                                value: dropdownGroupValue,
                                items: groupMap.values.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedGroupId = groupMap.keys.firstWhere(
                                        (id) => groupMap[id] == newValue,
                                        orElse: () => 'Select Group');
                                    print(
                                        "Selected Group ID: $selectedGroupId");

                                    subgroupMap.clear();

                                    if (selectedGroupId == '0') {
                                      EasyLoading.showError(
                                          'Please Select Aircraft Type');
                                    } else {
                                      selectedGroupis = selectedGroupId;
                                      _fetchsubgroup(selectedGroupId);
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Select an Aircraft Type',
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
                                  color: Colors.black,
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
                                value: dropdownSubGroupValue,
                                items: subgroupMap.values.map((String value) {
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
                                    selectedSubGroupId = subgroupMap.keys
                                        .firstWhere(
                                            (id) => subgroupMap[id] == newValue,
                                            orElse: () => '0');
                                    print(
                                        "Selected SubGroup ID: $selectedSubGroupId");

                                    if (selectedSubGroupId == '0') {
                                      EasyLoading.showError(
                                          'Please Select a Parent Aircraft Type');
                                    } else {
                                      selectedSubGroupis = selectedSubGroupId;
                                      _showLoginButton = true;
                                    }
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
                                  color: Colors.black,
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
                                  if (_passwordcontroller.text.toString() ==
                                      "") {
                                    EasyLoading.showError(
                                        "Please Enter Password");
                                  } else {
                                    _loginAuthenticate(_passwordcontroller.text,
                                        selectedGroupis);
                                  }

                                  // setState(() {
                                  //   _isPressed = !_isPressed;
                                  //
                                  //   Navigator.pushNamed(
                                  //     context,
                                  //     "/home",
                                  //   );
                                  // });
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
