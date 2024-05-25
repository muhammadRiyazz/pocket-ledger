import 'package:expence_app/consts/colors/colors&sizes&style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFeildLabel extends StatelessWidget {
  const TextFeildLabel({
    super.key,
    required this.label
  });
final String label;
  @override
  Widget build(BuildContext context) {
    return Text(label,textAlign: TextAlign.center,
           style: GoogleFonts.montserrat(color: textfieldlabelclr,
               fontWeight: FontWeight.w500, fontSize: 12));
  }
}
