import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:falcon_aviation/utils/app_color.dart';
import 'package:falcon_aviation/view/screen/file_manager/file_manager.dart';
import 'package:falcon_aviation/view/screen/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_font.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';

enum _SelectedTab { home, folder, person }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _selectedTab = _SelectedTab.home;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      if (_selectedTab == _SelectedTab.person) {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      }
      else if (_selectedTab == _SelectedTab.folder) {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => FileManager(),
          ),
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
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(35.0),
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
                                  'Capt. Alpha',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: AppFont.OutfitFont,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'A6-FHD',
                                  style: TextStyle(
                                    color: Color(0xFF969492),
                                    fontSize: 14,
                                    fontFamily: AppFont.OutfitFont,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.0),
                            CircleAvatar(
                              backgroundImage: AssetImage(dummyProfile),
                              radius: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Wrap(
                      spacing: 25.0,
                      runSpacing: 25.0,
                      children: [
                        for (var app in [
                          {'label': 'Windy.Com', 'color': Color(0xFFFFE1E1), 'icon': 'assets/appicons/windy.png'},
                          {'label': 'Leon', 'color': Color(0xFFE1F0FF), 'icon': 'assets/appicons/leon.png'},
                          {'label': 'IQM', 'color': Color(0xFFE1E9FF), 'icon': 'assets/appicons/ideagen.png'},
                          {'label': 'ForeFlight', 'color': Color(0xFFE1F0FF), 'icon': 'assets/appicons/foreflight.png'},
                          {'label': 'AirNavigation', 'color': Color(0xFFFFF4E1), 'icon': 'assets/appicons/airnavugationpro.png'},
                        ])
                          SizedBox(
                            width: (MediaQuery.of(context).size.width - 30) / 4,
                            child: appCard(
                              label: app['label'] as String,
                              color: app['color'] as Color,
                              iconAsset: app['icon'] as String,
                              redirectUrl: 'x-apple-reminderkit://',
                            ),
                          ),
                      ],
                    ),
                  ),


                  SizedBox(height: 30.0),
                  Divider(
                    height: 20,
                    thickness: 0.3,
                    indent: 35,
                    endIndent: 35,
                    color: Colors.black,
                  ),
                  SizedBox(height: 15.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Favourites',
                          style: TextStyle(
                            fontFamily: AppFont.OutfitFont,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // print('viewall');
                          },
                          child: Text(
                            'View all',
                            style: TextStyle(
                                fontFamily: AppFont.OutfitFont,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: 5,
          right: MediaQuery.of(context).size.width * 0.18, // 10% of screen width
          left: MediaQuery.of(context).size.width * 0.18, // 10% of screen width
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

  Widget appCard({
    required String label,
    required Color color,
    required String iconAsset,
    required String redirectUrl,
  }) {
    return GestureDetector(
      onTap: () => _openApp(redirectUrl),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconAsset,
              height: 90.0,
            ),
            SizedBox(height: 30.0),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppFont.OutfitFont,
                fontSize: MediaQuery.of(context).size.width * 0.018,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openApp(String url) async {
    var mapsUrlScheme = url;

    if (await canLaunchUrl(Uri.parse(mapsUrlScheme))) {
      await launchUrl(Uri.parse(mapsUrlScheme));
    } else {
      print('Could not launch Maps app');
    }
  }
}
