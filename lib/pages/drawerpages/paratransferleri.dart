import 'dart:io';

import 'package:bankauygulamasi/pages/drawerpages/ayarlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/bildirimler.dart';
import 'package:bankauygulamasi/pages/drawerpages/doviz.dart';
import 'package:bankauygulamasi/pages/drawerpages/hesap.dart';
import 'package:bankauygulamasi/pages/drawerpages/kartlar.dart';
import 'package:bankauygulamasi/pages/homepage.dart';
import 'package:bankauygulamasi/pages/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParaTransferleriPage extends StatefulWidget {
  const ParaTransferleriPage({super.key});

  @override
  State<ParaTransferleriPage> createState() => _ParaTransferleriPageState();
}

class _ParaTransferleriPageState extends State<ParaTransferleriPage> {
  CollectionReference kullaniciBilgi =
  FirebaseFirestore.instance.collection('Kullanıcılar');
  final aliciController = TextEditingController();
  final tutarController = TextEditingController();
  final aciklamaController = TextEditingController();
  bool veriAlindi = false;
  String varlik = "",aliciVarlik = "",aliciHesap = "",tutar = "";
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Kullanıcılar")
        .doc(FirebaseAuth.instance.currentUser!.displayName)
        .get()
        .then((gelenVeri) {
      setState(() {
        var response = gelenVeri.data();
        varlik = response?['varliklar'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Para Transferleri",
          style: TextStyle(color: Colors.black,),
        ),
        actions: [
          IconButton(
            splashColor: const Color.fromRGBO(150, 150, 150, 1),
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Bildirim"),
                      content: const Text("Bildiriminiz Bulunmamaktadır."),
                      actions: [
                        MaterialButton(
                            child: const Text("Kapat"),
                            onPressed: () => Navigator.pop(context))
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.black38,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => const MainPage()));
                            FirebaseAuth.instance.signOut();
                          },
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.white70,
                          )
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.black26,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.displayName
                        .toString()
                        .toUpperCase() ??
                        "",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Ana Sayfa"),
              leading: const Icon(Icons.home),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Hesap"),
              leading: const Icon(Icons.person),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HesapPage()));
              },
            ),
            ListTile(
              selected: true,
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Para Transferleri"),
              leading: const Icon(Icons.compare_arrows),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ParaTransferleriPage()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Döviz"),
              leading: const Icon(Icons.attach_money),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DovizPage()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Kartlar"),
              leading: const Icon(Icons.credit_card),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const KartlarPage()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Ayarlar"),
              leading: const Icon(Icons.settings),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AyarlarPage()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Bildirimler"),
              leading: const Icon(Icons.notifications_outlined),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const BildirimlerPage()));
              },
            ),
            const SizedBox(
              height: 140,
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const MainPage()));
                FirebaseAuth.instance.signOut();
              },
              child: const Text(
                "Güvenli Çıkış",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gönderen",
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
            ),
            Text(FirebaseAuth.instance.currentUser!.displayName.toString().toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17
              ),
            ),
            const Text("Cari Hesap",
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  fontSize: 17,
                ),
            ),
            TextField(
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: "$varlik TL",
                hintStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19),
              ),
              enabled: false,
            ),
            const SizedBox(height: 20,),
            const Text("Alıcı",
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            TextField(
              controller: aliciController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Alıcı Hesap İsmi",
                hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                aliciHesap = value;
              },
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: tutarController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Tutar",
                hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                tutar = value;
              },
            ),
            const SizedBox(height: 20,),
            MaterialButton(
                color: const Color.fromRGBO(0, 0, 0, 0.3),
                minWidth: double.infinity,
                onPressed: () {
                  if(aliciHesap.isNotEmpty && tutar.isNotEmpty)
                    {
                      if(double.parse(tutar) <= double.parse(varlik) && double.parse(tutar)>=0) {
                        varlik = (double.parse(varlik) - double.parse(tutar)).toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"varliklar": varlik}).then((result) {
                          debugPrint("Para Gönderildi");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        FirebaseFirestore.instance
                            .collection("Kullanıcılar")
                            .doc(aliciHesap)
                            .get()
                            .then((gelenVeri) {
                          setState(() {
                            var response = gelenVeri.data();
                            aliciVarlik = response?['varliklar'];
                          });
                        });
                        aliciVarlik = (double.parse(aliciVarlik) + double.parse(tutar)).toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(aliciHesap)
                            .update({"varliklar": aliciVarlik}).then((result) {
                          debugPrint("Para Gönderildi");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Başarılı"),
                                content: const Text("Para Alıcıya Gönderilmiştir."),
                                actions: [
                                  MaterialButton(
                                      child: const Text("Kapat"),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              );
                            });
                      }
                      else {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Hata"),
                                content: const Text("Hesabınızda girdiğiniz tutar kadar para bulunmamaktadır."),
                                actions: [
                                  MaterialButton(
                                      child: const Text("Kapat"),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              );
                            });
                      }
                    }
                  else {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Uyarı"),
                            content: const Text("Lütfen boş bıraktığınız yerleri doldurunuz."),
                            actions: [
                              MaterialButton(
                                  child: const Text("Kapat"),
                                  onPressed: () => Navigator.pop(context))
                            ],
                          );
                        });
                  }
                },
                child: const Text("Gönder",style: TextStyle(color: Colors.white),),
              ),
          ],
        ),
      ),
    );
  }
}
