import 'package:englifyar/features/home/layouts/bannerPath.dart';
import 'package:englifyar/features/home/layouts/headerPath.dart';
import 'package:englifyar/features/home/layouts/kelasPath.dart';
import 'package:englifyar/features/home/layouts/scorePath.dart';
import 'package:englifyar/features/home/layouts/searchPath.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerPath(),
                searchPath(),
                bannerPath(),
                SizedBox(
                  height: 20,
                ),
                scorepath(),
                SizedBox(
                  height: 20,
                ),
                // kelasPath(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
