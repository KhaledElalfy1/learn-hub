import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleManager {
  static TextStyle descriptionPoppins(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
          fontSize: fontSize ?? 16.sp,
          color: color,
          fontWeight: fontWeight ?? FontWeight.normal);
  static TextStyle mediumPoppins(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
          fontSize: fontSize ?? 16.sp,
          color: color,
          fontWeight: fontWeight ?? FontWeight.w500);
  static TextStyle titlePoppins(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
          fontSize: fontSize ?? 22.sp,
          color: color,
          fontWeight: fontWeight ?? FontWeight.bold);
}
