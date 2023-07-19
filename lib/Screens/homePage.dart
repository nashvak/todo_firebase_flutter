import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //create a variable that refers collection field in the database
  final CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  //delete method
  void deleteData(docId) {
    students.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Todo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: students.orderBy('name').snapshots(), //students collection
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                //read data
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot studentSnap =
                      snapshot.data.docs[index];
                  return ListTile(
                    title: Text(
                      studentSnap['name'],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      studentSnap['age'].toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            deleteData(studentSnap.id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/update', arguments: {
                              //this step will pass all value to the textbox
                              'name': studentSnap['name'],
                              'age': studentSnap['age'].toString(),
                              'id': studentSnap.id,
                            });
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
              );
            }
            return Container();
          }),
    );
  }
}
