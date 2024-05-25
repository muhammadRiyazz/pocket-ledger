import 'dart:developer';

import 'package:expence_app/presendation/screen%20home/screen_home.dart';
import 'package:expence_app/presendation/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    nextpage(context: context);

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        const Center(
            child: SizedBox(
          // width: MediaQuery.of(context).size.width * .6,
          child:                  MainTitle(label: 'Pocket Ledger'),

        )),
        Positioned(
          bottom: 10,
          right: 10,
          left: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Version 1.0.0 ',
                style: GoogleFonts.montserrat(
                    fontSize: 12, color: Colors.white38, letterSpacing: 1),
              ),
            ],
          ),
        )
      ]),
    );
  }

    nextpage({required BuildContext context}) async {
     

    await Future.delayed(const Duration(seconds: 4));

    await goto(context: context);
  }

  goto({required BuildContext context}) async {

    
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const ScreenHome();
        },
      ), (route) => false);
    }
  }

