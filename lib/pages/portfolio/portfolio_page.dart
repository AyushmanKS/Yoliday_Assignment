import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int selectedIndex = 0;

  final List<Widget> _pages = [
    const ProjectPage(),
    const SavedPage(),
    const SharedPage(),
    const AchievementPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160.h),
          child: Container(
            margin: EdgeInsets.only(top: 60.h),
            child: AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: const Text(
                  'Portfolio',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SvgPicture.asset(
                    'assets/images/icons/ic_round-shopping-bag.svg',
                    width: 28.w,
                    height: 28.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: SvgPicture.asset(
                    'assets/images/icons/Vector.svg',
                    width: 28.w,
                    height: 28.h,
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
                    selectedIndex = index;
                  });
                },
                tabs: const [
                  Tab(
                    child: Text(
                      'Project',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Saved',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Shared',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Achievement',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                  ),
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
