// import 'package:duo_clone/utils/constans.dart';
import 'package:englifyar/core/services/test_service.dart';
import 'package:englifyar/core/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:duo_clone/screens/home/pages/ai_conversation_screen.dart';

class bannerPath extends StatelessWidget {
  const bannerPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppPallete.secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ayo ngobrol bareng Mici\nuntuk meningkatkan\nkemampuan bahasa\ninggrismu!",
                  style: GoogleFonts.inter(
                    fontSize: MediaQuery.of(context).size.width / 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 33),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TestService();
                        },
                      ),
                    );
                  },
                  child: Container(
                    child: Text(
                      "Mulai",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 4,
            child: Container(
              height: 150,
              width: 150,
              child: Image.asset(
                "assets/images/banner.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
