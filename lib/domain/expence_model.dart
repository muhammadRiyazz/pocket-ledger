import 'package:hive_flutter/adapters.dart';
    part 'expence_model.g.dart';


@HiveType(typeId: 1)
class ExpModel extends HiveObject {
  @HiveField(0)
  final String exptitle;
  @HiveField(1)
  final String expdesc;
  @HiveField(2)
  final String expamount;
  @HiveField(3)
  final String expdate;
  

  ExpModel({
    required this.exptitle,
    required this.expdesc,
    required this.expamount,
    required this.expdate,
  });
}
