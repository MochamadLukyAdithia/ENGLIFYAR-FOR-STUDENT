import 'package:englifyar/core/theme/pallete.dart';
import 'package:englifyar/features/home/layouts/searchPath.dart';
import 'package:flutter/material.dart';

class MisiScreen extends StatefulWidget {
  const MisiScreen({super.key});

  @override
  State<MisiScreen> createState() => _MisiScreenState();
}

class _MisiScreenState extends State<MisiScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                searchPath(),
                SizedBox(height: 20),
                buildMissionCard(screenWidth, screenHeight, "Group Mision"),
                SizedBox(
                  height: 20,
                ),
                buildMissionCard(
                    screenWidth, screenHeight, "Individual Mission"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMissionCard(
      double screenWidth, double screenHeight, String buttonText) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppPallete.primaryColor.withOpacity(0.9),
            Colors.grey.shade200
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/class.png",
                  width: double.infinity,
                  height: screenHeight / 4,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "⏳ Durasi : 30 Menit",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPallete.secondaryColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "📝 Catatan : Tonton sampai habis karena akan ada tugas di akhir",
            style: TextStyle(fontSize: 16, color: AppPallete.secondaryColor),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPallete.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
                elevation: 8,
              ),
              child: Text(
                "🚀 ${buttonText}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppPallete.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
