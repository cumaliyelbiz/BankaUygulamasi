import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KurlarPage extends StatefulWidget{
  const KurlarPage({super.key});

  @override
  State<KurlarPage> createState() => _KurlarPageState();
}

class _KurlarPageState extends State<KurlarPage> {
  final Stream<QuerySnapshot> dateRef =
  FirebaseFirestore.instance.collection('Kurlar').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Kurlar",style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: dateRef,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Bir şeyler ters gitti');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Flexible(
                  child: ListView(
                    children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      return ListTile(
                          title: Text(data['kurname']),
                          textColor: Colors.black,
                          subtitle: Text(data['kurfiyat']),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}