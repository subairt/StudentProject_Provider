import 'package:hive_flutter/adapters.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String age;
  @HiveField(3)
  String number;
  @HiveField(4)
  String mark;
  @HiveField(5)
  String profpic;

  Student(
      {required this.name,
      required this.age,
      required this.number,
      required this.mark,
      required this.profpic});
}
