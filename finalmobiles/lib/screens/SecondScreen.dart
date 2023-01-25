import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Screen',
      home: Scaffold(
        appBar: AppBar(title: const Text('Firebase tasks')),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            List<DocumentSnapshot> docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    docs[index].data as Map<String, dynamic>;
                return ListTile(
                  leading: Checkbox(
                    value: data['state'],
                    onChanged: (bool? value) {},
                  ),
                  title: Text(data['name']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
