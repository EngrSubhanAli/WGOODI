import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


//colors
Color darkcolor = const Color(0xFF465462);

Color backgroundColor = const Color(0xFFFFFFFF);

Color btnColor = const Color(0xFF90898E);



// custom font style
TextStyle myTextStylelarge = GoogleFonts.quicksand(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
TextStyle myTextStylemedium = GoogleFonts.quicksand(
  fontSize: 20,
  fontWeight: FontWeight.normal,
);
TextStyle myTextStylesmall = GoogleFonts.quicksand(
  fontSize: 13,
  fontWeight: FontWeight.normal,
);

// custom input text fields
InputDecorationTheme myInputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    hintStyle: myTextStylesmall,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide:  BorderSide(
        color: Colors.grey,
      ),
    ),
  );
}
