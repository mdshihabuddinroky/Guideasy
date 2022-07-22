import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:travel/guidelist.dart';
import 'package:travel/tourguid.dart';

void main() {
  runApp(const Initpage());
}

class Initpage extends StatelessWidget {
  const Initpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AppTest',
          theme: ThemeData.light(),
          home: const Home(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = [
      "assets/guider.webp",
      "assets/holiday.webp",
      "assets/passport.png",
      "assets/bell-ring.png",
      "assets/plane-ticket.png",
      "assets/5-stars.png",
      "assets/application.png",
      "assets/magnifying-glass.png"
    ];
    var name = [
      "Guider",
      "Holiday",
      "Visa",
      "",
      "Flights",
      "Hotels",
      "More",
      ""
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Image.asset(
                      "assets/developer.jpeg",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey Rocky",
                      style: GoogleFonts.dmSans(
                          fontSize: 11.sp, color: const Color(0xffb4b4ba)),
                    ),
                    Text("What are you looking for..",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 211, 217, 220),
                    child: Image.asset(
                      "assets/map.png",
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 5, bottom: 5),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: image.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Get.to(const Tourguid());
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: (name[index] != "")
                                    ? Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Column(children: [
                                          Image.asset(
                                            image[index],
                                            height: 45,
                                            width: 45,
                                            fit: BoxFit.fill,
                                          ),
                                          SizedBox(
                                            height: 0.7.h,
                                          ),
                                          Text(
                                            name[index],
                                            style: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w700),
                                          )
                                        ]),
                                      )
                                    : Center(
                                        child: Image.asset(
                                          image[index],
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "DESTINATION WE LOVE",
                      style: GoogleFonts.ptSans(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    Text(
                      "View All",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Colors.orangeAccent),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfff5f4f6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Image.asset(
                                  "assets/coxsbazar.jpeg",
                                  height: 20.h,
                                  width: 70.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Starts from",
                                            style: GoogleFonts.ptSans(
                                                color: Colors.grey,
                                                fontSize: 13.sp)),
                                        Text("45000 BDT",
                                            style: GoogleFonts.ptSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Cox's Bazar",
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp)),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Chittagong Bangladesh",
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: Colors.grey)),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xfff5f4f6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Image.asset(
                                  "assets/dubai.jpeg",
                                  height: 20.h,
                                  width: 70.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Starts from",
                                            style: GoogleFonts.ptSans(
                                                color: Colors.grey,
                                                fontSize: 13.sp)),
                                        Text("375,000 BDT",
                                            style: GoogleFonts.ptSans(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Dubai",
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp)),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("UAE",
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: Colors.grey)),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "POPULAR TOUR GUIDES",
                  style: GoogleFonts.ptSans(
                      fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
              ),
              Guidelist(true)
            ],
          ),
        ),
      ),
    );
  }
}
