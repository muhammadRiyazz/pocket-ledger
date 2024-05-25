import 'package:expence_app/consts/colors/colors&sizes&style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackbar(BuildContext context, String title, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                                  color: maincolor,
                                  fontWeight: FontWeight.w500,
                                )
            ),
          
          SizedBox(height: 2), // Add some space between title and message
          Text(message,
          style:
          GoogleFonts.montserrat()),
        ],
      ),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
}
