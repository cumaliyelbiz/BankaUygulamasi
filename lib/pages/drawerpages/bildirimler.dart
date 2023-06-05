import 'package:bankauygulamasi/pages/drawerpages/ayarlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/doviz.dart';
import 'package:bankauygulamasi/pages/drawerpages/hesap.dart';
import 'package:bankauygulamasi/pages/drawerpages/kartlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/paratransferleri.dart';
import 'package:bankauygulamasi/pages/homepage.dart';
import 'package:bankauygulamasi/pages/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BildirimlerPage extends StatefulWidget {
  const BildirimlerPage({super.key});

  @override
  State<BildirimlerPage> createState() => _BildirimlerPageState();
}

class _BildirimlerPageState extends State<BildirimlerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bildirimler",
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
              selected: true,
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
        alignment: Alignment.center,
        child: const Text("Bildirimiz bulunmamaktadır.",style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        fontSize: 17,
      )),
      ),
    );
  }
}
