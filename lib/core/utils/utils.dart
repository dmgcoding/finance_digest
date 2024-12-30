import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackbar(BuildContext context, String msg) {
  final snack = SnackBar(
      content: Text(
    msg,
    style: GoogleFonts.roboto(),
  ));
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
