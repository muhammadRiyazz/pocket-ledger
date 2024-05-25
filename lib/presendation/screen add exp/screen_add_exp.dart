import 'dart:developer';

import 'package:expence_app/application/bloc/expence_bloc.dart';
import 'package:expence_app/consts/colors/colors&sizes&style.dart';
import 'package:expence_app/domain/expence_model.dart';
import 'package:expence_app/presendation/widgets/main_appbar.dart';
import 'package:expence_app/presendation/widgets/main_title.dart';
import 'package:expence_app/presendation/widgets/mianbutton.dart';
import 'package:expence_app/presendation/widgets/snakbar.dart';
import 'package:expence_app/presendation/widgets/text_feild_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class Screenaddexp extends StatelessWidget {
  Screenaddexp({super.key, this.expmodel});
  ExpModel? expmodel;

  final amtController = TextEditingController();

  final titleController = TextEditingController();
  final dateController = TextEditingController();

  final descController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final ValueNotifier<String> _dateNotifier = ValueNotifier<String>("");
  String selecteddate = '';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selecteddate = "${pickedDate.toLocal()}".split(' ')[0];
      _dateNotifier.value = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
  _dateNotifier.value = expmodel != null ? expmodel!.expdate : '';

    amtController.text = expmodel != null ? expmodel!.expamount : '';
    titleController.text = expmodel != null ? expmodel!.exptitle : '';
    dateController.text = expmodel != null ? expmodel!.expdate : '';
    descController.text = expmodel != null ? expmodel!.expdesc : '';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  MainAppBar(
                      ontap: () {
                        Navigator.pop(context);
                      },
                      label: 'Back'),
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: boxShadow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             MainTitle(label: expmodel==null? 'Add Expense':'Edit Expense'),
                            h20,
                            const TextFeildLabel(label: "Amount"),
                            h5,
                            TextFormField(
                              controller: amtController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                formKey.currentState!.validate();
                              },
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an amount';
                                }
                                final number = double.tryParse(value);
                                if (number == null || number <= 0) {
                                  return 'Please enter a valid amount';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                hintText: 'eg:- 200',
                                hintStyle: hintStyle,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: textfieldborder),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: textfieldborder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: maincolor),
                                ),
                              ),
                            ),
                            h15,
                            const TextFeildLabel(label: "Expence Title"),
                            h5,
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an title';
                                }
                                return null;
                              },
                              controller: titleController,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                                formKey.currentState!.validate();
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                hintText: 'eg:- for travel',
                                hintStyle: hintStyle,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: textfieldborder),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: textfieldborder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: maincolor),
                                ),
                              ),
                            ),
                            h15,
                            const TextFeildLabel(label: "Date"),
                            h5,
                            ValueListenableBuilder<String>(
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
                                  decoration: InputDecoration(
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
                            ),
                            h15,
                            const TextFeildLabel(label: "Description"),
                            h5,
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an Description ';
                                }
                                int minWordCount = 6;

                                if (value.split(' ').length < minWordCount) {
                                  return 'Description should be at least $minWordCount words';
                                }
                                return null;
                              },
                              controller: descController,
                              maxLines: 4,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                                formKey.currentState!.validate();
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                hintText: 'Add Description',
                                hintStyle: hintStyle,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: textfieldborder),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: textfieldborder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: maincolor),
                                ),
                              ),
                            ),
                            h20,
                            BlocConsumer<ExpenceBloc, ExpenceState>(
                              listener: (context, state) {



                            },
                              builder: (context, state) {
                                return state.isLoading
                                    ? const LinearProgressIndicator(
                                        backgroundColor: Colors.white,
                                        color: maincolor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      )
                                    : MainButton(
                                        ontap: () {
                                          if (formKey.currentState!
                                              .validate()) {


                                                if (expmodel != null) {

                                                  log('edit exp');
                                                   BlocProvider.of<ExpenceBloc>(
                                                    context)
                                                .add(ExpenceEvent.editExp(key:expmodel!.key ,contx: context,
                                                    expdata: ExpModel(
                                                        exptitle:
                                                            titleController
                                                                .text,
                                                        expdesc:
                                                            descController.text,
                                                        expamount:
                                                            amtController.text,
                                                        expdate:
                                                            selecteddate)));
                                                } else {
                                                         BlocProvider.of<ExpenceBloc>(
                                                    context)
                                                .add(ExpenceEvent.addExp(contx: context,
                                                    expdata: ExpModel(
                                                        exptitle:
                                                            titleController
                                                                .text,
                                                        expdesc:
                                                            descController.text,
                                                        expamount:
                                                            amtController.text,
                                                        expdate:
                                                            selecteddate)));
                                                }
                                     
                                          }
                                        },
                                        title:expmodel != null? 'Update ':'Add',
                                      );
                              },
                            ),
                          ],
                        ),
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
