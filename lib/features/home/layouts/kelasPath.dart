// import 'package:duo_clone/screens/home/pages/all_kelas_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class kelasPath extends StatelessWidget {
  const kelasPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Daftar Kelasmu',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return AllKelasScreen();
                  //     },
                  //   ),
                  // );
                },
                child: Text(
                  'Lihat Semua',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.blueAccent.shade200,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 160,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        left: 15,
                        right: 15,
                        child: Image.asset(
                          "assets/images/class.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 15,
                        right: 15,
                        child: Text(
                          "Vocabulary - Shortclass",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 160,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        left: 15,
                        right: 15,
                        child: Image.asset(
                          "assets/images/class.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 15,
                        right: 15,
                        child: Text(
                          "Vocabulary - Shortclass",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
