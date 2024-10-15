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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(
              'assets/images/icons/ic_round-shopping-bag.svg',
              width: 28, // Adjust the width as needed
              height: 28, // Adjust the height as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(
              'assets/images/icons/Vector.svg',
              width: 28, // Adjust the width as needed
              height: 28, // Adjust the height as needed
            ),
          ),
        ],
      ),
    );
  }
}
