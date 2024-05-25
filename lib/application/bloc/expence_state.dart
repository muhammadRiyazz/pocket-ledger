part of 'expence_bloc.dart';

@freezed
class ExpenceState with _$ExpenceState {
  factory ExpenceState({
    required bool isLoading,
    required bool isError,



    required String lastweekexp,
    required List<ExpModel> explist,
        required List<ExpModel> filterlist,

  }) = _ExpenceState;
  factory ExpenceState.initial() {
    return ExpenceState(
        isError: false, isLoading: false, explist: [], lastweekexp: '0.00',filterlist: [],);
  }
}
