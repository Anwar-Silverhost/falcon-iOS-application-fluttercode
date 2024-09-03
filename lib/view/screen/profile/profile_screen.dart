import 'dart:ui';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_font.dart';

enum _SelectedTab { home, folder, person }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _selectedTab = _SelectedTab.person;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      if (_selectedTab == _SelectedTab.person) {
        Navigator.pushNamed(
          context,
          "/profile",
        );
      } else if (_selectedTab == _SelectedTab.home) {
        Navigator.pushNamed(
          context,
          "/home",
        );
      }else if (_selectedTab == _SelectedTab.folder) {
        Navigator.pushNamed(
          context,
          "/file_manager",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Logo
                          Image.asset(
                            RedBlackLogo,
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(dummyProfile),
                                radius: 40.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        top: 10,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                profileBack), // Replace with your image asset
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                16.0), // Adjust padding as needed
                            child: Text(
                              'PROFILE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                fontFamily: AppFont.OutfitFont,
                                letterSpacing:
                                    13.0, // Adjust letter spacing as needed
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        width: double.infinity, // Use available width
                        height: 90.0, // Set a fixed height, adjust as needed
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            // Positioned Image
                            Positioned(
                              top:
                                  -115,
                              left: 20,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(dummyProfile),
                                radius: MediaQuery.of(context).size.width *
                                    0.1, // 10% of screen width
                              ),
                            ),
                            // Main Row
                            Positioned(
                              top: -100,
                              left: MediaQuery.of(context).size.width * 0.25,
                              right: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                      height:
                                          100),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Left side: Text
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Capt. Alpha',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025,
                                              fontFamily: AppFont.OutfitFont,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            'A6-FHD',
                                            style: TextStyle(
                                              color: Color(0xFF969492),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.015,
                                              fontFamily: AppFont.OutfitFont,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                
                
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.17, // 17% of screen width
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03, // 3% of screen height
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _showLogoutDialog(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    Color(0xFF2D2A26),
                                                backgroundColor: Colors.white,
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Text(
                                                'Log Out',
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.018, // 1.8% of screen width
                                                  fontFamily: AppFont.OutfitFont,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF2D2A26),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.17, // 17% of screen width
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03, // 3% of screen height
                                            child: ElevatedButton(
                                              onPressed: () {Navigator.pushNamed(
                                                context,
                                                "/edit_profile",
                                              );},
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    Color(0xFF2D2A26),
                                                backgroundColor: Colors.white,
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Text(
                                                'Edit Profile',
                                                style: TextStyle(
                                                  fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.018, // 1.8% of screen width
                                                  fontFamily: AppFont.OutfitFont,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF2D2A26),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                
                
                
                
                
                
                
                
                
                
                
                    
                    Padding(
                      padding: const EdgeInsets.all(25.0),

                      child: Container(
                        padding: EdgeInsets.only(
                            left: 50.0, right: 50.0, top: 30, bottom: 30),
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius:
                              BorderRadius.circular(14), // Border radius
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Left Side: First Name
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'First Name',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Capt.',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last Name',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Alpha',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20), // Space between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Email
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'alpha@falconaviation.ae',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                // Phone
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '+912 0000 000 ',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                
                            SizedBox(height: 20), // Space between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Email
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'alpha@falcon',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                
                            SizedBox(height: 20), // Space between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Email
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Passowrd',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '•••••••••••',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.022,
                                              fontFamily: AppFont.OutfitFont,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showChangePasswordDialog(context);
                                            },
                                            child: Text(
                                              'Change password',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.022,
                                                  fontFamily: AppFont.OutfitFont,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                
                            SizedBox(height: 20), // Space between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Email
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Male',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                
                            SizedBox(height: 20), // Space between rows
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Email
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Place',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.019,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Al Bateen Executive Airport, P.O Box 62030, Abu Dhabi, UAE.',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                          fontFamily: AppFont.OutfitFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Color(0xFFF2F2F2),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
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
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: 5,
          right: MediaQuery.of(context).size.width * 0.18,
          left: MediaQuery.of(context).size.width * 0.18,
        ),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          indicatorColor: AppColor.primaryColor,
          borderRadius: 10,
          paddingR: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 110,
          unselectedItemColor: Colors.white70,
          backgroundColor: AppColor.primaryColor,
          splashBorderRadius: 10,
          outlineBorderColor: Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,
          enableFloatingNavBar: true,
          enablePaddingAnimation: true,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.folder,
              unselectedIcon: IconlyLight.folder,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.user_3,
              unselectedIcon: IconlyLight.user_1,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
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
            child: Container(
              width: 500,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Log Out?',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: AppFont.OutfitFont,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Are you sure to logout?',
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: AppFont.OutfitFont,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFF2D2A26),
                            backgroundColor: Color(0xFFFFFFFF),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            side: BorderSide(color: Colors.black, width: 1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: AppFont.OutfitFont,
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0xFF2D2A26),
                            backgroundColor: Color(0xFFFFFFFF),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            side: BorderSide(color: Colors.black, width: 1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                              fontFamily: AppFont.OutfitFont,
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]);
      },
    );
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: 500,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Change your Password',
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
                            child: Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 45,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFont.OutfitFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Color(0xFFCACAC9)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFF626262)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'New Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFont.OutfitFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          hintStyle: TextStyle(color: Color(0xFFCACAC9)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFF626262)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppFont.OutfitFont,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(color: Color(0xFFCACAC9)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFF626262)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Color(0xFFCACAC9)),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity, // Make button full width
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color(0x74FFFFFF),
                            backgroundColor: Color(0xFFAA182C),
                            padding: const EdgeInsets.all(18.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Set Password',
                            style: TextStyle(
                              fontFamily: AppFont.OutfitFont,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ]);
      },
    );
  }
}
