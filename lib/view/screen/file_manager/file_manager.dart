import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_constant.dart';
import '../../../utils/app_font.dart';

enum _SelectedTab { home, folder, person }

class FileManager extends StatefulWidget {
  const FileManager({Key? key}) : super(key: key);

  @override
  State<FileManager> createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {
  var _selectedTab = _SelectedTab.folder;

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
      } else if (_selectedTab == _SelectedTab.folder) {
        Navigator.pushNamed(
          context,
          "/file_manager",
        );
      }
    });
  }

  final List<Map<String, dynamic>> fileData = [
    {
      "id": 1,
      "pdf_name": "Flight Managment",
      "pdf_file": "/media/pdf/flight_and_airport_management_names.pdf",
      "created_at": "2024-08-15 11:00:51",
      "status": "1",
      "group": {"id": 13, "name": "SubGroup A1"},
      "group_path": [
        {"id": 10, "name": "Group A"},
        {"id": 13, "name": "SubGroup A1"}
      ],
      "category": {"id": 40, "name": "Chapter 1 Maths"},
      "category_path": [
        {"id": 31, "name": "OPS Document"},
        {"id": 33, "name": "Delay Doc"},
        {"id": 36, "name": "Section 1"},
        // {"id": 40, "name": "Chapter 1 Maths"}
      ]
    },
    {
      "id": 6,
      "pdf_name": "Helicopter Management",
      "pdf_file": "/media/pdf/Text-Weather_report.pdf",
      "created_at": "2024-08-20 04:38:54",
      "status": "1",
      "group": {"id": 13, "name": "SubGroup A1"},
      "group_path": [
        {"id": 10, "name": "Group A"},
        {"id": 13, "name": "SubGroup A1"}
      ],
      "category": {"id": 39, "name": "COMPUTER ELEMENT"},
      "category_path": [
        {"id": 32, "name": "Aircraft Document"},
        {"id": 35, "name": "AS-G10 AirCraft"},
        {"id": 39, "name": "AirCraft Path"}
      ]
    },
    {
      "id": 8,
      "pdf_name": "Crew Management",
      "pdf_file": "/media/pdf/API_Service_Documentation_aZwzf9b.pdf",
      "created_at": "2024-08-23 08:44:49",
      "status": "1",
      "group": {"id": 13, "name": "SubGroup A1"},
      "group_path": [
        {"id": 10, "name": "Group A"},
        {"id": 13, "name": "SubGroup A1"}
      ],
      "category": {"id": 36, "name": "Maths 10A"},
      "category_path": [
        {"id": 31, "name": "General Documents"},
        {"id": 33, "name": "Aviation Reports"},
        {"id": 36, "name": "DRB Document"}
      ]
    },
    {
      "id": 9,
      "pdf_name": "Maths File",
      "pdf_file": "/media/pdf/Main-Weather_report_2ASFnyu.pdf",
      "created_at": "2024-08-23 08:45:54",
      "status": "1",
      "group": {"id": 13, "name": "SubGroup A1"},
      "group_path": [
        {"id": 10, "name": "Group A"},
        {"id": 13, "name": "SubGroup A1"}
      ],
      "category": {"id": 36, "name": "Maths 10A"},
      "category_path": [
        {"id": 32, "name": "Aircraft Document"},
        {"id": 35, "name": "AS-G10 AirCraft"},
        {"id": 39, "name": "AirCraft Path"}
      ]
    }
  ];

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
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4, // 40% of the screen
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              children: _buildExpansionTiles(fileData, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04),
                        Expanded(
                          flex: 6, // 50% of the screen
                          child: Container(
                            color: Colors.grey[200],
                            child: Center(
                              child: Text('Document Viewer',
                                  style: TextStyle(fontSize: 24)),
                            ),
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

  List<Widget> _buildExpansionTiles(
      List<Map<String, dynamic>> fileData, int level) {
    final Map<String, Map<String, dynamic>> pathMap = {};
    final Set<String> displayedPaths = {};

    // Organize files by category path
    for (var file in fileData) {
      final List<Map<String, dynamic>> categoryPath =
      List<Map<String, dynamic>>.from(file['category_path']);
      final String pdfName = file['pdf_name'];
      final String pdfFile = file['pdf_file'];

      String pathKey = categoryPath.map((e) => e['name']).join('/');
      if (!pathMap.containsKey(pathKey)) {
        pathMap[pathKey] = {'path': categoryPath, 'files': []};
      }
      pathMap[pathKey]!['files']
          .add({'pdf_name': pdfName, 'pdf_file': pdfFile});
    }

    // Generate the ExpansionTiles
    return pathMap.entries.map((entry) {
      final categoryPath = List<Map<String, dynamic>>.from(entry.value['path']);
      final files = List<Map<String, dynamic>>.from(entry.value['files']);

      return _buildPathExpansionTile(categoryPath, files, level, displayedPaths);
    }).toList();
  }

  Widget _buildPathExpansionTile(
      List<Map<String, dynamic>> path,
      List<Map<String, dynamic>> files,
      int level,
      Set<String> displayedPaths) {
    if (path.isEmpty) {
      return SizedBox.shrink();
    }

    final current = path.first;
    final remainingPath = path.sublist(1);

    final currentPathKey = path.map((e) => e['name']).join('/');

    if (displayedPaths.contains(currentPathKey)) {
      return SizedBox.shrink();
    }

    displayedPaths.add(currentPathKey);

    return ExpansionTile(
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 20.0 * (level + 1)),
        child: Image.asset(
          foldericon,
          width: 30.0,
          height: 30.0,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          current['name'],
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.020,
            fontFamily: AppFont.OutfitFont,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      children: [
        if (remainingPath.isEmpty && files.isNotEmpty)
          ...files.map((file) {
            return ListTile(
              contentPadding: EdgeInsets.only(left: 22.0),
              leading: Padding(
                padding: EdgeInsets.only(left: 22.0 * (level + 1)),
                child: Image.asset(
                  pdficon,
                  width: 30.0,
                  height: 30.0,
                ),
              ),
              title: Text(
                file['pdf_name'],
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.019,
                  fontFamily: AppFont.OutfitFont,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              dense: true,
              tileColor: Colors.transparent,
              onTap: () {
                // Handle file tap
                print('Opening ${file['pdf_file']}');
              },
            );
          }).toList()
        else
          _buildPathExpansionTile(remainingPath, files, level + 1, displayedPaths),
      ],
    );
  }

}

