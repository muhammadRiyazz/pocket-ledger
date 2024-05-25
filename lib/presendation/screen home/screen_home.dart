import 'package:expence_app/application/bloc/expence_bloc.dart';
import 'package:expence_app/consts/colors/colors&sizes&style.dart';
import 'package:expence_app/presendation/screen%20add%20exp/screen_add_exp.dart';
import 'package:expence_app/presendation/screen%20all%20exp/screen_all_exp.dart';
import 'package:expence_app/presendation/widgets/main_title.dart';
import 'package:expence_app/presendation/widgets/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExpenceBloc>(context).add(ExpenceEvent.fetchlist());
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            h15,
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                //  boxShadow: boxShadow,
              ),
              child: Row(children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: maincolor,
                  ),
                  child: const Icon(
                    Icons.bar_chart_rounded,
                    color: Colors.white,
                  ),
                ),
                w10,
                const MainTitle(label: 'Pocket Ledger'),
                const Spacer(),
                // IconButton(
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(
                //         builder: (context) {
                //           return ScreenSearch();
                //         },
                //       ));
                //     },
                //     icon: const Icon(Icons.search)),
               
                   
              ]),
            ),
            h10,
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: maincolor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lastweek Expense',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 12,
                      )),
                  h5,
                  BlocBuilder<ExpenceBloc, ExpenceState>(
                    builder: (context, state) {
                      return Text('₹ ${state.lastweekexp}',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 22,
                          ));
                    },
                  ),
                  h15,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Screenaddexp();
                          },
                        ));
                      },
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                            child: Text('Add Expense',
                                style:
                                    GoogleFonts.nunitoSans(color: maincolor))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //             height: 4,
            //             width: 50,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(5),
            //                 color: maincolor),
            //           )
            h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Expenses',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 14,
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ScreenAllexp();
                      },
                    ));
                  },
                  child: Text('View more',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: maincolor,
                        fontSize: 12,
                      )),
                )
              ],
            ),
            h20,
            BlocBuilder<ExpenceBloc, ExpenceState>(
              builder: (context, state) {
                return  state.filterlist.isEmpty?Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.network ('https://img.freepik.com/premium-vector/no-data-concept-illustration_86047-485.jpg'),),
                  ],
                ): Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      state.explist.length <= 5 ? state.explist.length : 5,
                      (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //   return ScreenDetails();
                          // },));
                        },
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: boxShadow,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      state.explist[index]
                                                          .exptitle,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                        state.explist[index]
                                                            .expdate,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 13,
                                                                color:
                                                                    textfieldlabelclr)),
                                                  ],
                                                ),
                                                h5,
                                                Text(
                                                  state.explist[index].expdesc,
                                                  style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    color: textfieldlabelclr,
                                                  ),
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  maxLines:
                                                      null, // allows unlimited lines
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      h15,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 245, 245, 245),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 8),
                                              child: Text(
                                                  '₹ ${state.explist[index].expamount}',
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: maincolor)),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                    builder: (context) {
                                                      return Screenaddexp(
                                                        expmodel: state
                                                            .explist[index],
                                                      );
                                                    },
                                                  ));
                                                },
                                                child: Container(
                                                    decoration: const BoxDecoration(
                                                        color: maincolor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 15,
                                                          vertical: 8),
                                                      child: Text('Edit',
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white)),
                                                    )),
                                              ),
                                              w10,
                                              InkWell(
                                                onTap: () {
                                                  BlocProvider.of<ExpenceBloc>(
                                                          context)
                                                      .add(ExpenceEvent
                                                          .deleteExp(
                                                              contx: context,
                                                              key: state
                                                                  .explist[
                                                                      index]
                                                                  .key));
                                                },
                                                child: BlocListener<ExpenceBloc,
                                                    ExpenceState>(
                                                  listener: (context, state) {},
                                                  child: Container(
                                                      decoration: const BoxDecoration(
                                                          color: maincolor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6,
                                                                horizontal: 7),
                                                        child: Icon(
                                                          Icons.delete_outlined,
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  }),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
