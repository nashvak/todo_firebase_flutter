import 'package:firebase_example/Screens/ReusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  //firestore variable
  final CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  //function to add data
  void addData() {
    final data = {
      'name': nameController.text,
      'age': ageController.text,
    };
    students.add(data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ReusableTextfield('Name', nameController),
            const SizedBox(
              height: 30,
            ),
            ReusableTextfield("Age", ageController),
            const SizedBox(
              height: 30,
            ),
            button('Add Notes', () {
              addData();
            })
          ],
        ),
      ),
    );
  }
}
