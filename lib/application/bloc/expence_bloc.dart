import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:expence_app/domain/expence_model.dart';
import 'package:expence_app/presendation/widgets/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'expence_event.dart';
part 'expence_state.dart';
part 'expence_bloc.freezed.dart';

class ExpenceBloc extends Bloc<ExpenceEvent, ExpenceState> {
  ExpenceBloc() : super(ExpenceState.initial()) {
    on<AddExp>((event, emit) async {
      log('message 1');
      emit(state.copyWith(
        isLoading: true,
      ));

      try {
        final stddatabase = await Hive.openBox<ExpModel>('exp_database');
        await stddatabase.add(event.expdata);
        List<ExpModel> expModelList =
            stddatabase.values.toList().cast<ExpModel>();

        showSnackbar(event.contx, 'Success', 'Expence Added successful');
        Navigator.pop(event.contx);
        BlocProvider.of<ExpenceBloc>(event.contx)
            .add(const ExpenceEvent.fetchlist());

        emit(state.copyWith(
          explist: expModelList,
          isLoading: false,
        ));
      } catch (e) {
        log(e.toString());
      }
    });

    on<Fetchlist>((event, emit) async {
      log('message 2');

      emit(state.copyWith(
        isLoading: true,
      ));
      final stddatabase = await Hive.openBox<ExpModel>('exp_database');
      List<ExpModel> expModelList =
          stddatabase.values.toList().cast<ExpModel>();
      DateTime now = DateTime.now();
      DateTime oneWeekAgo = now.subtract(Duration(days: 7));

      List<ExpModel> lastWeekExpenses = expModelList.where((exp) {
        DateTime expDate = DateTime.parse(exp.expdate);
        return expDate.isAfter(oneWeekAgo) && expDate.isBefore(now);
      }).toList();

      double totalLastWeekExpenses = lastWeekExpenses.fold(
          0.0, (sum, exp) => sum + double.parse(exp.expamount));
      log(expModelList.length.toString());
      emit(state.copyWith(
          explist: expModelList,
          filterlist: expModelList,
          isLoading: false,
          lastweekexp: totalLastWeekExpenses.toString()));
    });
    on<Listsort>((event, emit) async {
      log('message 3');

      emit(state.copyWith(
        isLoading: true,
      ));
      final stddatabase = await Hive.openBox<ExpModel>('exp_database');
      List<ExpModel> expModelList =
          stddatabase.values.toList().cast<ExpModel>();

      List<ExpModel> filteredList = expModelList.where((expModel) {
        return expModel.expdate == event.date;
      }).toList();

      emit(state.copyWith(
        explist: expModelList,
        filterlist: filteredList,
        isLoading: false,
      ));
    });
    on<DeleteExp>((event, emit) async {
      log('message 4');

      emit(state.copyWith(
        isLoading: true,
      ));
      final stddatabase = await Hive.openBox<ExpModel>('exp_database');
      await stddatabase.delete(event.key);
      List<ExpModel> expModelList =
          stddatabase.values.toList().cast<ExpModel>();
      showSnackbar(event.contx, 'Removed', 'Expence Removed successful');
      BlocProvider.of<ExpenceBloc>(event.contx)
          .add(const ExpenceEvent.fetchlist());

      emit(state.copyWith(
        explist: expModelList,
        isLoading: false,
      ));
    });

    on<EditExp>((event, emit) async {
      log('message 5');

      emit(state.copyWith(
        isLoading: true,
      ));
      final expdatabase = await Hive.openBox<ExpModel>('exp_database');
      await expdatabase.put(event.key, event.expdata);
      final explist = await Hive.openBox<ExpModel>('exp_database');

      List<ExpModel> expModelList = explist.values.toList().cast<ExpModel>();

      showSnackbar(event.contx, 'Success', 'Expence Updated successful');
      Navigator.pop(event.contx);
      BlocProvider.of<ExpenceBloc>(event.contx)
          .add(const ExpenceEvent.fetchlist());

      emit(state.copyWith(
        explist: expModelList,
        isLoading: false,
      ));
    });
  }
}
