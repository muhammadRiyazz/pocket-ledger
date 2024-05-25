part of 'expence_bloc.dart';

@freezed
class ExpenceEvent with _$ExpenceEvent {
  const factory ExpenceEvent.fetchlist() = Fetchlist;
  const factory ExpenceEvent.addExp({required ExpModel expdata,required BuildContext contx}) = AddExp;
  const factory ExpenceEvent.editExp({required ExpModel expdata,required dynamic key,required BuildContext contx}) = EditExp;
  const factory ExpenceEvent.deleteExp({required dynamic key,required BuildContext contx}) = DeleteExp;
  const factory ExpenceEvent.listsort({required String date}) = Listsort;
}
