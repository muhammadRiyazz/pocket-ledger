import 'package:expence_app/application/bloc/expence_bloc.dart';
import 'package:expence_app/consts/colors/colors&sizes&style.dart';
import 'package:expence_app/domain/expence_model.dart';
import 'package:expence_app/presendation/screen%20add%20exp/screen_add_exp.dart';
import 'package:expence_app/presendation/widgets/main_appbar.dart';
import 'package:expence_app/presendation/widgets/main_title.dart';
import 'package:expence_app/presendation/widgets/mianbutton.dart';
import 'package:expence_app/presendation/widgets/text_feild_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ScreenAllexp extends StatelessWidget {
  ScreenAllexp({super.key, });


    final ValueNotifier<String> _dateNotifier = ValueNotifier<String>("");
Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {


          BlocProvider.of<ExpenceBloc>(context).add(ExpenceEvent.listsort(date: "${pickedDate.toLocal()}".split(' ')[0]));

      // selecteddate = "${pickedDate.toLocal()}".split(' ')[0];
      _dateNotifier.value = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExpenceBloc>(context).add(const ExpenceEvent.fetchlist());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  MainAppBar(
                      ontap: () {
                        Navigator.pop(context);
                      },
                      label: 'Back'),  ValueListenableBuilder<String>(
                              valueListenable: _dateNotifier,
                              builder: (context, value, child) {
                                return TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Select  Date ';
                                    }
                                    return null;
                                  },
                                  controller:
                                      TextEditingController(text: value),
                                  decoration: InputDecoration( suffix: Icon(Icons.date_range_outlined,color: maincolor,weight: 4,),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    hintText: 'Select Date',
                                    hintStyle: hintStyle,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const   BorderSide(
                                          color: textfieldborder),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          color: textfieldborder),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          const BorderSide(color: maincolor),
                                    ),
                                  ),
                                  readOnly: true,
                                  onTap: () => _selectDate(context),
                                );
                              },
                            ),h15,
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: boxShadow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: BlocBuilder<ExpenceBloc, ExpenceState>(
              builder: (context, state) {
                return state.filterlist.isEmpty?Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.network ('https://img.freepik.com/premium-vector/no-data-concept-illustration_86047-485.jpg'),),
                  ],
                ):
                
                
                
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                  
                  
                   List.generate(state.filterlist.length, (index) {
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
                                                      state.filterlist[index]
                                                          .exptitle,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                        state.filterlist[index]
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
                                                  state.filterlist[index].expdesc,
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
                                                  '₹ ${state.filterlist[index].expamount}',
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: maincolor)),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                  return Screenaddexp(expmodel: state.filterlist[index],);
                                                },));
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
                                                          .deleteExp(contx: context,
                                                              key: state
                                                                  .filterlist[
                                                                      index]
                                                                  .key));
                                                },
                                                child: Container(
                                                    decoration: const BoxDecoration(
                                                        color: maincolor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 6,
                                                              horizontal: 7),
                                                      child: Icon(
                                                        Icons.delete_outlined,
                                                        color: Colors.white,
                                                      ),
                                                    )),
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
            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
