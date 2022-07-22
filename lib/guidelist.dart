import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget Guidelist(bool home) {
  var name = [
    "Faysal Ahmed",
    "Marnoon Ahmed",
    "Imtiaz SHakil Khan",
    "Md shihab Uddin",
    "Wahidujjaman Anis"
  ];
  var image = [
    "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
    "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
    "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-male-employee-in-office-picture-id1309328823?b=1&k=20&m=1309328823&s=170667a&w=0&h=a-f8vR5TDFnkMY5poQXfQhDSnK1iImIfgVTVpFZi_KU=",
    "https://media.istockphoto.com/photos/portrait-of-handsome-smiling-young-man-with-crossed-arms-picture-id1200677760?k=20&m=1200677760&s=612x612&w=0&h=JCqytPoHb6bQqU9bq6gsWT2EX1G5chlW5aNK81Kh4Lg=",
    "https://img.freepik.com/free-photo/handsome-confident-smiling-man-with-hands-crossed-chest_176420-18743.jpg?w=2000"
  ];
  return ListView.builder(
      shrinkWrap: true,
      itemCount: name.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff5f4f6)),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image[index],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name[index],
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      home
                          ? "Chittagong, Bangladesh"
                          : "Bangla, English, Hindi, Urdu",
                      style: GoogleFonts.dmSans(
                          color: Colors.grey, fontSize: 11.sp),
                    ),
                    SizedBox(
                      height: 0.7.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.verified_outlined,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Verified Guider",
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Image.asset(
                  "assets/medal.png",
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 2.w,
                )
              ])),
        );
      }));
}
