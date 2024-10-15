import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'project_page.dart';
import 'saved_page.dart';
import 'shared_page.dart';
import 'achievement_page.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ProjectPage(),
    const SavedPage(),
    const SharedPage(),
    const AchievementPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length, // Use the length of _pages
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160.0),
          child: Container(
            margin: const EdgeInsets.only(top: 60),
            child: AppBar(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Portfolio'),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                    'assets/images/icons/ic_round-shopping-bag.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20.0),
                  child: SvgPicture.asset(
                    'assets/images/icons/Vector.svg',
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
              bottom: TabBar(
                indicatorColor: Colors.orange,
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                tabs: const [
                  Tab(text: 'Project'),
                  Tab(text: 'Saved'),
                  Tab(text: 'Shared'),
                  Tab(text: 'Achievement'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _pages,
        ),
      ),
    );
  }
}
