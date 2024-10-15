import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(160.0), // Set the height of the AppBar
          child: Container(
            margin: const EdgeInsets.only(top: 60),
            child: AppBar(
              title: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.0), // Padding only for title
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
              bottom: const TabBar(
                //isScrollable: true,
                indicatorColor: Colors.orange,
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: 'Project'),
                  Tab(text: 'Saved'),
                  Tab(text: 'Shared'),
                  Tab(text: 'Achievement'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Project Content')),
            Center(child: Text('Saved Content')),
            Center(child: Text('Shared Content')),
            Center(child: Text('Achievement Content')),
          ],
        ),
      ),
    );
  }
}
