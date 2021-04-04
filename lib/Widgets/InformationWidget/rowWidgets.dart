import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myRow(String title, String text, {bool isSmall = false}) {
  return DefaultTextStyle(
    style: GoogleFonts.robotoSlab(fontSize: isSmall ? 14 : 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(
          text,
          style: GoogleFonts.aBeeZee(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

/// this my widget to `make` text with icons
Widget myRowIcon(String title, bool ok) {
  return DefaultTextStyle(
    style: GoogleFonts.robotoSlab(fontSize: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          ok ? Icons.done : null,
          color: Colors.green,
        ),
        Text(title),
      ],
    ),
  );
}
