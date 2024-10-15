import 'package:flutter/material.dart';
import 'package:yoliday_assignment/pages/home_page.dart';
import 'package:yoliday_assignment/pages/input_page.dart';
import 'package:yoliday_assignment/pages/portfolio_page.dart';
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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          // curving edges of bottom nav bar
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.home, 'Home', 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.emergency, 'Portfolio', 1),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.medical_information, 'Input', 2),
              label: 'Input',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.person, 'Profile', 3),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: const Color(0xFFd6d1d5),
          onTap: onItemTapped,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (selectedIndex == index)
          Container(
            height: 3,
            width: 30,
            color: Colors.orange, // Thin orange line
          ),
        Icon(
          icon,
          size: 30,
          color:
              selectedIndex == index ? Colors.orange : const Color(0xFFd6d1d5),
        ),
      ],
    );
  }
}
