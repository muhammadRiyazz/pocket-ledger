import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,required this.label
  });
final String label;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600, fontSize: 17));
  }
}
