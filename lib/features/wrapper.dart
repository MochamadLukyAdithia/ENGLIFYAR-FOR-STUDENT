import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:englifyar/core/theme/pallete.dart';
import 'package:englifyar/core/utils/icon.dart';
import 'package:englifyar/features/home/screens/home_screen.dart';
import 'package:englifyar/features/kelas/screens/misi_screen.dart';
import 'package:englifyar/features/quiz/screens/quiz_screen.dart';

import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

import 'package:flutter_svg/flutter_svg.dart';

// import 'package:iconify_design/iconify_design.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late final List<Widget> pages;
  List<Widget> _items() => [
        _buildNavItem(
          icon: _selectedIndex == 0 ? Myicon.homeSelected : Myicon.home,
          label: "Home",
          isActive: _selectedIndex == 0,
        ),
        _buildNavItem(
          icon: _selectedIndex == 1 ? Myicon.laptopSelected : Myicon.laptop,
          label: "Misi",
          isActive: _selectedIndex == 1,
        ),
        _buildNavItem(
          icon: _selectedIndex == 2 ? Myicon.cameraSelected : Myicon.camera,
          label: "Camera",
          isActive: _selectedIndex == 2,
        ),
        _buildNavItem(
          icon: _selectedIndex == 3 ? Myicon.quizSelected : Myicon.quiz,
          label: "Quiz",
          isActive: _selectedIndex == 3,
        ),
        _buildNavItem(
          icon: _selectedIndex == 4 ? Myicon.profileSelected : Myicon.profile,
          label: "Profile",
          isActive: _selectedIndex == 4,
        ),
      ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    pages = [
      // const Center(child: Icon(Zondicons),)

      HomeScreen(),
      MisiScreen(),
      const Center(
        child: Iconify(
          Myicon.laptop,
        ),
      ),
      QuizScreen(),
      const Center(
        child: Iconify(
          Myicon.profile,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      backgroundColor: AppPallete.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: AppPallete.primaryColor,
        animationCurve: Curves.linearToEaseOut,
        color: AppPallete.secondaryColor,
        buttonBackgroundColor: Colors.white,
        items: _items(),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required bool isActive,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.string(
            icon,
            color: isActive ? Colors.black : Colors.white,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
          SizedBox(height: isActive ? 20 : 4),
          Text(
            label,
            style: TextStyle(
              fontSize: isActive ? 0 : 10,
              color: isActive ? Colors.black : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
