// import 'package:duo_clone/screens/home/pages/all_mentor_screen.dart';
import 'package:englifyar/core/theme/pallete.dart';
import 'package:flutter/material.dart';

class scorepath extends StatelessWidget {
  const scorepath({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 20,
                  child: Image.asset(
                    "assets/images/fire.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    "Kamu sudah menyelesaikan 3 misi, ayo sisa 2 misi lagi!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Ayo tingkatkan semangat belajarmu🙌",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(width: double.infinity, child: scoreOne(screenWidth)),
        SizedBox(
          height: 20,
        ),
        scoreTwo(screenWidth),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Tanya Guru",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        scorePath(
          text:
              "Jangan ragu untuk bertanya pada guru jika ada yang kurang dipahami 😇",
          color: AppPallete.scoreTeacher,
          image: "assets/images/message.png",
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Tanya Teman",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        scorePath(
          text: "Ayo mulai berdiskusi dengan teman-temanmu 🙌",
          color: AppPallete.scoreStudent,
          image: "assets/images/message.png",
        ),
      ],
    );
  }

  Container scorePath(
      {required String text, required Color color, required String image}) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        // Expanded harus berada dalam Row atau Column
        children: [
          SizedBox(width: 20),
          Image(
            image: AssetImage(image),
            height: 40,
            width: 40,
          ),
          SizedBox(width: 20),
          Expanded(
            // Diperbolehkan di sini
            child: Text(
              "${text}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Row scoreTwo(double screenWidth) {
    return Row(
      children: [
        Expanded(
          // Tambahkan Expanded
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppPallete.scoreThree,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 10), // Kurangi padding
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image29.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5), // Kurangi jarak
                Expanded(
                  // Agar teks tidak mendorong keluar
                  child: Text(
                    "Misi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10), // Kurangi jarak antar widget
        Expanded(
          // Tambahkan Expanded
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppPallete.scoreFour,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image30.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "Quiz",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row scoreOne(double screenWidth) {
    return Row(
      children: [
        Expanded(
          // Pastikan widget ini fleksibel
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppPallete.scoreOne,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 10), // Kurangi padding
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image19.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5), // Kurangi jarak jika perlu
                Expanded(
                  // Agar teks tidak memaksa ukuran
                  child: Text(
                    "300 Poin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow
                        .ellipsis, // Jika terlalu panjang, diberi "..."
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10), // Kurangi jarak antar widget jika perlu
        Expanded(
          // Tambahkan Expanded di sini juga
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppPallete.scoreTwo,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image28.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "Fluent Speaker",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
