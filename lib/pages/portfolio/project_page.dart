import 'package:flutter/material.dart';
import 'package:yoliday_assignment/components/custom_search_textfield.dart';
import 'package:yoliday_assignment/components/filter_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final List<Map<String, String>> _projects = [
    {
      'title': 'Kemampuan Merangkum \nTulisan',
      'imagePath': 'assets/images/img_1.png'
    },
    {'title': 'Project B', 'imagePath': 'assets/images/img_2.png'},
    {'title': 'Project C', 'imagePath': 'assets/images/img_3.png'},
    {'title': 'Project D', 'imagePath': 'assets/images/img_4.png'},
    {'title': 'Project E', 'imagePath': 'assets/images/img_5.png'},
  ];

  List<Map<String, String>> _filteredProjects = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredProjects = _projects;
  }

  void _filterProjects(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredProjects = _projects
          .where((project) =>
              project['title']!.toLowerCase().contains(_searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            CustomSearchTextField(onSearch: _filterProjects),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredProjects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: const Color(0xFFd6d1d5),
                          width: 1.w,
                        ),
                      ),
                      child: SizedBox(
                        height: 120.h,
                        child: Row(
                          children: [
                            Image.asset(
                              _filteredProjects[index]['imagePath']!,
                              width: 120.w,
                              height: 120.h,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _filteredProjects[index]['title']!,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    SizedBox(height: 28.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            text: const TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'BAHASA SUNDA\n',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Oleh Al-Baiqi Samaan',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF9E95A2),
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          width: 55.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFFF39519),
                                                Color(0xFFFFCD67),
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: Text(
                                              'A',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FilterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
