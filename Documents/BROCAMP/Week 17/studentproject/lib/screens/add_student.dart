import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentproject/db/model/student_model.dart';
import 'package:studentproject/db/providers/student_provider.dart';
import 'package:studentproject/db/providers/temp_image_provider.dart';

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key});

  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _markcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tempImageProvider =
        Provider.of<TempImageProvider>(context, listen: false);
    tempImageProvider.tempImagePath = null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Student'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<TempImageProvider>(
                      builder: (context, value, child) => Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: value.tempImagePath == null
                                ? const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/IMG_3893.png'),
                                    radius: 65,
                                  )
                                : CircleAvatar(
                                    radius: 65,
                                    backgroundImage: FileImage(
                                      File(value.tempImagePath!),
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                              onPressed: () async {
                                await value.getImage();
                              },
                              icon: const Icon(Icons.photo),
                              label: const Text('Add Photo')),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
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
                          prefixIcon: Icon(Icons.person)),
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
                          label: Text("Student's Age"),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Icon(Icons.star)),
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
                          prefixIcon: Icon(Icons.phone)),
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
                          label: Text('Total Mark'),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Icon(Icons.score)),
                      validator: (value) {
                        if (_markcontroller.text.isEmpty) {
                          return 'Total Mark Field is Empty';
                        } else if (int.parse(_markcontroller.text) > 100) {
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
                                backgroundColor: Colors.red),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.cancel),
                            label: const Text('Cancel')),
                        Consumer<TempImageProvider>(
                          builder: (context, value, child) =>
                              Consumer<StudentProvider>(
                            builder: (context, value2, child) =>
                                ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(130, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        backgroundColor: Colors.green[600]),
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        if (value.tempImagePath == null) {
                                          addingFailed(context);
                                        } else {
                                          addingSuccess(value2, context, value);
                                        }
                                      }
                                    },
                                    icon: const Icon(Icons.send),
                                    label: const Text('Submit')),
                          ),
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
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Please add the profile picture!'),
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      duration: Duration(seconds: 2),
    ));
  }

  void addingSuccess(
      StudentProvider value, BuildContext context, TempImageProvider value2) {
    Student st = Student(
        name: _namecontroller.text.trim(),
        age: _agecontroller.text.trim(),
        number: _phonecontroller.text.trim(),
        mark: _markcontroller.text.trim(),
        profpic: value2.tempImagePath!);
    value.addStudent(st);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
          Text('${_namecontroller.text}is added to database successfully!'),
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      duration: const Duration(seconds: 2),
    ));
    value2.tempImagePath = null;
    value2.notify();
    Navigator.of(context).pop();
  }
}
