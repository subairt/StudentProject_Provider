import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/student_model.dart';

class StudentProvider extends ChangeNotifier{
  List<Student>students =[];

  Future<void>addStudent(Student student)async{
    final studentDB =await Hive.openBox<Student>('student_db');
    students.add(student);
    await studentDB.add(student);
    notifyListeners();
  }
  Future<void>getAllStudents()async{
    final studentDB = await Hive.openBox<Student>('student_db');
    students.clear();
    students.addAll(studentDB.values);
    notifyListeners();
  }
  Future<void>deleteStudent(int index)async{
    final studentDB = await Hive.openBox<Student>('student_db');
    await studentDB.deleteAt(index);
    getAllStudents();
  }
  Future<void>editStudent(int index,Student student)async{
    final studentDB = await Hive.openBox<Student>('student_db');
    await studentDB.putAt(index, student);
    getAllStudents();
    notifyListeners();
  }
}