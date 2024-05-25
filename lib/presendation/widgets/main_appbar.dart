
import 'package:expence_app/consts/colors/colors&sizes&style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,required this.ontap,required this.label
  });
final ontap;
final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            const Icon(Icons.keyboard_backspace_outlined),
            w10,
            Text(label,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
