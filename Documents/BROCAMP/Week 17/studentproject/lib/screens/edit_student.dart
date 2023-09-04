import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentproject/db/providers/student_provider.dart';
import 'package:studentproject/db/providers/temp_image_provider.dart';

import '../db/model/student_model.dart';

class EditStudent extends StatelessWidget{
  final int index;
  final _formkey = GlobalKey<FormState>();

  EditStudent({Key? key, required this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _namecontroller = TextEditingController();
    final _agecontroller = TextEditingController();
    final _phonecontroller = TextEditingController();
    final _markcontroller = TextEditingController();

    final studentProvider = Provider.of<StudentProvider>(context,listen:false);
    final tempImageProvider = Provider.of<TempImageProvider>(context,listen:false);


    String name = studentProvider.students[index].name;
    _namecontroller.text = name;
    String age = studentProvider.students[index].age;
    _agecontroller.text = age;
    String phone = studentProvider.students[index].number;
    _phonecontroller.text = phone;
    String mark = studentProvider.students[index].mark;
    _markcontroller.text = mark;
    String profile = studentProvider.students[index].profpic;
    tempImageProvider.tempImagePath = profile;

    return Scaffold(
      appBar: AppBar(
        title: Text(_namecontroller.text),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<TempImageProvider>(
                      builder: (context, value2, child) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: value2.tempImagePath == null
                                  ? const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/IMG_3893.png'),
                                      radius: 65,
                                    )
                                  : CircleAvatar(
                                      radius: 65,
                                      backgroundImage: FileImage(
                                        File(value2.tempImagePath!),
                                      ),
                                    ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                              onPressed: () async{
                                await value2.getImage();
                              },
                              icon: const Icon(Icons.photo),
                              label: const Text("Add Photo"),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _namecontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text("Student's Name"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (_namecontroller.text.isEmpty) {
                          return 'Name Field is Empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _agecontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        label: Text("Student's Age"),
                        prefixIcon: Icon(Icons.star),
                      ),
                      validator: (value) {
                        if (_agecontroller.text.isEmpty) {
                          return 'Age Field is Empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _phonecontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Guardian's Phone"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      maxLength: 10,
                      validator: (value) {
                        if (_phonecontroller.text.isEmpty) {
                          return 'Phone Field is Empty';
                        } else if (_phonecontroller.text.length < 10) {
                          return 'Enter a valid Phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _markcontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Total Mark"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(Icons.score),
                      ),
                      validator: (value) {
                        if (_markcontroller.text.isEmpty) {
                          return 'Total Mark Field is Empty';
                        } else if (int.tryParse(_markcontroller.text) == null ||
                            int.parse(_markcontroller.text) > 100) {
                          return 'Enter a valid Mark';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.cancel),
                          label: const Text("Cancel"),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(130, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: Colors.green[600],
                          ),
                          onPressed: () {
                            if (_formkey.currentState?.validate() == null &&
                                _namecontroller.text.isNotEmpty &&
                                _agecontroller.text.isNotEmpty &&
                                _phonecontroller.text.isNotEmpty &&
                                _markcontroller.text.isNotEmpty) {
                              if (tempImageProvider.tempImagePath == null) {
                                addingFailed(context);
                              } else {
                                updateSuccess(
                                    context,
                                    index,
                                    _namecontroller.text,
                                    _agecontroller.text,
                                    _phonecontroller.text,
                                    _markcontroller.text,
                                    tempImageProvider.tempImagePath!);
                              }
                            }
                          },
                          icon: const Icon(Icons.send),
                          label: const Text("Submit"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

 

  void addingFailed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please add the profile picture!"),
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void updateSuccess(BuildContext context, int index, String name, String age,
      String phone, String mark, String imagePath) {
    final value = Provider.of<StudentProvider>(context, listen: false);
    final value2 = Provider.of<TempImageProvider>(context, listen: false);
    Student st = Student(
      name: name.trim(),
      age: age.trim(),
      number: phone.trim(),
      mark: mark.trim(),
      profpic: imagePath,
    );
    value.editStudent(index, st);
    value2.tempImagePath = null;
    value2.notify();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$name's details edited successfully!"),
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: const Duration(seconds: 2),
      ),
    );
    value2.tempImagePath = null;
    Navigator.of(context).pop();
  }
}


