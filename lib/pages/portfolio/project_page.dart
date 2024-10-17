import 'package:flutter/material.dart';
import 'package:yoliday_assignment/components/custom_search_textfield.dart';
import 'package:yoliday_assignment/components/filter_button.dart';

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
    _filteredProjects = _projects; // Initially, show all projects
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomSearchTextField(
              onSearch: _filterProjects, // Pass the search function
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredProjects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: const Color(0xFFd6d1d5),
                          width: 1.0,
                        ),
                      ),
                      child: SizedBox(
                        height: 120,
                        child: Row(
                          children: [
                            Image.asset(
                              _filteredProjects[index]['imagePath']!,
                              width: 120,
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _filteredProjects[index]['title']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  Row(
                                    children: [
                                      RichText(
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
                                      const SizedBox(width: 60),
                                      Container(
                                        width: 55,
                                        height: 30,
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
                                              BorderRadius.circular(5),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                          ),
                                          child: const Text(
                                            'A',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
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
