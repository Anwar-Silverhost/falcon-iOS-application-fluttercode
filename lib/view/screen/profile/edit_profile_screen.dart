import 'dart:io';

import 'package:falcon_aviation/utils/app_color.dart';
import 'package:falcon_aviation/utils/app_constant.dart';
import 'package:falcon_aviation/utils/app_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final TextEditingController _firstnameTextfield = TextEditingController();
  final TextEditingController _lastnameTextfield = TextEditingController();
  final TextEditingController _emailTextfield = TextEditingController();
  final TextEditingController _phoneTextfield = TextEditingController();
  final TextEditingController _addressTextfield = TextEditingController();
  String? _selectedGender;

  File? _selectedImage;


  @override
  void initState() {
    super.initState();
    _updateTextField();
  }

  void _updateTextField() {
    _firstnameTextfield.text = 'Capt.';
    _lastnameTextfield.text = 'Alpha';
    _emailTextfield.text = 'alpha@falconaviation.ae';
    _phoneTextfield.text = '+98765003323';
    _selectedGender = 'Female';
    _addressTextfield.text = 'Al Bateen Executive Airport, P.O Box 62030, Abu Dhabi, UAE.';
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background container
          Padding(
            padding: const EdgeInsets.only(
              left: 28.0,
              right: 28.0,
              top: 28,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(profileBack),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Close button
          Positioned(
            top: 30,
            right: 25,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/profile",
                );
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
          ),
          // Title text
          Positioned(
            top: 85,
            left: 16,
            right: 16,
            child: Center(
              child: Text(
                'EDIT PROFILE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.025,
                  fontFamily: AppFont.OutfitFont,
                  letterSpacing: 15.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Profile image
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: 16,
            right: 16,
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                children: [



                  Container(
                    width: MediaQuery.of(context).size.width * 0.26,
                    height: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 6.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : AssetImage(dummyProfile) as ImageProvider,
                      radius: MediaQuery.of(context).size.width * 0.13,
                    ),
                  ),
                  // Red plus button
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.03,
                        ),
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                          if (image != null) {
                            final File imageFile = File(image.path);
                            final int fileSize = await imageFile.length();
                            const int maxSize = 2 * 1024 * 1024;

                            if (fileSize <= maxSize) {
                              EasyLoading.showProgress(0.5, status: 'Uploading Profile...');
                              setState(() {
                                _selectedImage = imageFile;
                              });
                              EasyLoading.dismiss();
                              EasyLoading.showSuccess('Profile uploaded!');
                            } else {
                              EasyLoading.showError('File size exceeds 2MB limit.');
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text('File size exceeds 2MB limit.'),
                              //   ),
                              // );
                            }
                          } else {
                            print('No image selected.');
                          }
                        },
                      ),
                    ),
                  ),




                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                left: 28.0,
                right: 28.0,
                top: MediaQuery.of(context).size.height * 0.33,
                bottom: 140),
            child: Container(
              padding:
                  EdgeInsets.only(left: 50.0, right: 50.0, top: 30, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(14), // Border radius
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
                                    MediaQuery.of(context).size.width * 0.019,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _firstnameTextfield,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.022,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none, // This removes the border

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
                                    MediaQuery.of(context).size.width * 0.019,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _lastnameTextfield,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.022,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
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
                                    MediaQuery.of(context).size.width * 0.019,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _emailTextfield,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.022,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
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
                                    MediaQuery.of(context).size.width * 0.019,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _phoneTextfield,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.022,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
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
                              'Gender',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.019,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(height: 5),

                            DropdownButtonFormField<String>(
                              value: _selectedGender,
                              items: ['Male', 'Female', 'Other']
                                  .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                              ),
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.022,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
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
                                    MediaQuery.of(context).size.width * 0.019,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _addressTextfield,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.022,
                                fontFamily: AppFont.OutfitFont,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
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


          Positioned(
            bottom:40,
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: SizedBox(
              width: double.infinity, // Make button full width
              child: ElevatedButton(
                onPressed: () {
                  EasyLoading.showSuccess('Profile updated successfully!');
                  Navigator.pushNamed(
                    context,
                    "/profile",
                  );
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
                  'Update',
                  style: TextStyle(
                    fontFamily: AppFont.OutfitFont,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),








        ],
      ),
    );
  }
}

//
// import 'package:falcon_aviation/utils/app_constant.dart';
// import 'package:falcon_aviation/utils/app_font.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 25.0,
//             right: 25.0,
//             top: 15,
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.2,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                         profileBack), // Replace with your image asset
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 60,
//                 left: 16,
//                 right: 16,
//                 child: Center(
//                   child: Text(
//                     'EDIT PROFILE',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: MediaQuery.of(context).size.width * 0.025,
//                       fontFamily: AppFont.OutfitFont,
//                       letterSpacing: 15.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//
//               Positioned(
//                 top: 25,
//                 right: 5,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(
//                       context,
//                       "/profile",
//                     );
//                   },
//                   child: Icon(
//                     Icons.close,
//                     color: Colors.white,
//                     size: MediaQuery.of(context).size.width * 0.04,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//
//
//           Positioned(
//             top: 120,
//             left: 16,
//             right: 16,
//             child: Container(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage(dummyProfile),
//                 radius: MediaQuery.of(context).size.width * 0.13,
//               ),
//             ),
//           ),
//
//
//
//
//
//
//
//
//         ),
//       ),
//     );
//   }
// }
