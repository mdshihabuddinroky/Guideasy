import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:travel/guidelist.dart';
import 'package:travel/nearby.dart';

class Tourguid extends StatelessWidget {
  const Tourguid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? _textEditingController;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          "Tour Guides",
          style: GoogleFonts.dmSans(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.5.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 76.w,
                    child: TextField(
                      controller: _textEditingController,
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        Get.to(const Nearby());
                      },
                      decoration: InputDecoration(
                          label: Text("Search guid"),
                          // hintText: "Search guides",
                          alignLabelWithHint: true,
                          labelStyle: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 176, 162, 162),
                                width: 1.5),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/magnifying-glass.png",
                              fit: BoxFit.cover,
                              height: 25,
                              width: 25,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    child: const Icon(
                      Icons.navigation_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "RECOMENDED GUIDES",
                    style: GoogleFonts.ptSans(
                        fontWeight: FontWeight.bold, fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  const Icon(
                    Icons.filter_list_outlined,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Guidelist(false),
            )
          ],
        ),
      ),
    );
  }
}
