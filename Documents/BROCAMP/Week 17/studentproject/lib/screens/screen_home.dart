import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentproject/db/providers/student_provider.dart';
import 'package:studentproject/screens/add_student.dart';
import 'package:studentproject/screens/screen_profile.dart';
import 'package:studentproject/widgets/screen_search.dart';

import 'edit_student.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    studentProvider.getAllStudents();
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        title: const Text('Student List'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddStudentScreen();
          }));
        },
        label: const Text(
          'Add Student',
          style: TextStyle(fontSize: 20),
        ),
        icon: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Consumer<StudentProvider>(
            builder: (context, value, child) => value.students.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return Flex(
                        direction: Axis.vertical,
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return ProfileScreen(
                                  index: index,
                                );
                              }));
                            },
                            leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: FileImage(
                                    File(value.students[index].profpic))),
                            title: Text(value.students[index].name,
                                style: const TextStyle(fontSize: 20)),
                            trailing: FittedBox(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return EditStudent(index: index);
                                      }));
                                    },
                                    icon: const Icon(Icons.edit),
                                    color: Colors.grey,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showAlert(context, index, value);
                                    },
                                    icon: const Icon(Icons.delete),
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: value.students.length)
                : const Center(child: Text('No Items to Display'))),
      )),
    );
  }

  void showAlert(BuildContext context, int index, dynamic value) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Do you want to delete ${value.students[index].name}'),
            content: const Text(
                'All the related datas will be cleared from the database'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    value.deleteStudent(index);
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Yes'))
            ],
          );
        });
  }
}
