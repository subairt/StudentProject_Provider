import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentproject/db/providers/student_provider.dart';

import 'edit_student.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget{
  int index;
  ProfileScreen({super.key,required this.index});
  
  @override
  Widget build(BuildContext context) {
   
   return Consumer<StudentProvider>(
    builder:(context,value,child)=>Scaffold(
     appBar: AppBar(
            title: Text('Profile of ${value.students[index].name}'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        child: Image.network(
                            'https://i.pinimg.com/originals/09/29/1f/09291f53e8d07c54e117c3abbf704f35.png'),
                      ),
                      FittedBox(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: FileImage(
                                      File(value.students[index].profpic)),
                                  radius: 65,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "Student's Name",
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "Student's Age",
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text("Guardian's Phone",
                                              style: TextStyle(fontSize: 17)),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text("Total Mark",
                                              style: TextStyle(fontSize: 17)),
                                        ],
                                      ),
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(":",
                                            style: TextStyle(fontSize: 17)),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(":",
                                            style: TextStyle(fontSize: 17)),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            value.students[index].name,
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            value.students[index].age,
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(value.students[index].number,
                                              style: const TextStyle(
                                                  fontSize: 17)),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(value.students[index].mark,
                                              style: const TextStyle(
                                                  fontSize: 17)),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800]),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return EditStudent(index: index);
                            }));
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text("Edit Proile"))
                    ]),
              ),
            ),
          )),
    );
  }
}
  

