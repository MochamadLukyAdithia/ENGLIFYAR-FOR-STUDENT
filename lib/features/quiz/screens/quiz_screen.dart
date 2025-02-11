import 'package:englifyar/core/theme/pallete.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              const SizedBox(height: 10),
              buildTitleSection(),
              const SizedBox(height: 20),
              buildMissionSteps(),
            ],
          ),
        ),
      ),
    );
  }

  /// HEADER: Menampilkan jumlah bintang dan poin pengguna
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppPallete.scoreThree,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconWithText(Icons.star, "150", Colors.yellow),
          _iconWithText(Icons.lightbulb, "3", Colors.yellow),
        ],
      ),
    );
  }

  Widget _iconWithText(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 5),
        Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }

  /// JUDUL "Latihan Soal"
  Widget buildTitleSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppPallete.scoreThree.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Latihan Soal",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// LAYOUT STEPS Misi
  Widget buildMissionSteps() {
    return SizedBox(
      height: 320, // Tambahkan tinggi agar Stack tidak error
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(top: 20, left: 50, child: stepCircle(true)),
          Positioned(top: 100, left: 100, child: stepCircle(true)),
          Positioned(
              top: 180, left: 150, child: stepCircle(false, isCurrent: true)),
          Positioned(top: 260, left: 200, child: stepCircle(false)),
        ],
      ),
    );
  }

  /// CIRCLE untuk Langkah Misi
  Widget stepCircle(bool completed, {bool isCurrent = false}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrent ? Colors.white : AppPallete.scoreThree,
        border: isCurrent
            ? Border.all(color: Colors.grey.shade400, width: 5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: completed
            ? Icon(Icons.check, color: Colors.white, size: 35)
            : isCurrent
                ? Icon(Icons.circle,
                    color: AppPallete.scoreThree,
                    size: 20) // Tambahkan indikator
                : null,
      ),
    );
  }

  /// BUTTON "Latihan Soal 3" dan "Kerjakan"
  Widget buildMissionButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppPallete.scoreThree,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Latihan Soal 3",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            ),
            child: Text(
              "Kerjakan",
              style: TextStyle(fontSize: 16, color: AppPallete.scoreThree),
            ),
          ),
        ],
      ),
    );
  }
}
