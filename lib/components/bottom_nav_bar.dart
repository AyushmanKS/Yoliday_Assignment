import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_assignment/pages/home_page.dart';
import 'package:yoliday_assignment/pages/input_page.dart';
import 'package:yoliday_assignment/pages/portfolio/portfolio_page.dart';
import 'package:yoliday_assignment/pages/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  PageController pageController = PageController();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          HomePage(),
          PortfolioPage(),
          InputPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28.0),
            topRight: Radius.circular(28.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _buildNavItem('assets/images/icons/Home svg.svg', 0),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem('assets/images/icons/Portfolio svg.svg', 1),
                label: 'Portfolio',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem('assets/images/icons/Input svg.svg', 2),
                label: 'Input',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem('assets/images/icons/Profile svg.svg', 3),
                label: 'Profile',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: const Color(0xFFDF5532),
            unselectedItemColor: const Color(0xFFd6d1d5),
            onTap: onItemTapped,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String svgPath, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (selectedIndex == index)
          Container(
            height: 3,
            width: 30,
            color: const Color(0xFFdf5532),
          ),
        const SizedBox(height: 5),
        SvgPicture.asset(
          svgPath,
          height: 25,
          colorFilter: ColorFilter.mode(
            selectedIndex == index
                ? const Color(0xFFdf5532)
                : const Color(0xFFd6d1d5),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
