import 'package:flutter/material.dart';
import 'package:firebase_example/Screens/ReusableWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  //firestore variable
  final CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  updateData() {}
  @override
  Widget build(BuildContext context) {
    //recieve the values passed in the homepage.dart to be updated from the database as map
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = args['name'];
    ageController.text = args['age'];
    final docId = args['id'];
    updateData(docId) {
      final data = {
        'name': nameController.text,
        'age': ageController.text,
      };
      students.doc(docId).update(data);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Notes"),
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
            button('Update Notes', () {
              //print(args);
              updateData(docId);
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }
}
