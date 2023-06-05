import 'package:bankauygulamasi/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MusteriOlPage extends StatefulWidget {
  const MusteriOlPage({super.key});

  @override
  State<MusteriOlPage> createState() => _MusteriOlPageState();
}

String email = "", password = "";
String email2 = "", password2 = "";

class _MusteriOlPageState extends State<MusteriOlPage> {
  final _dogrulamaAnahtari = GlobalKey<FormState>();
  final _dogrulamaAnahtari2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Müşteri Ol"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Bireysel",
              ),
              Tab(
                text: "Kurumsal",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Form(
              key: _dogrulamaAnahtari,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                height: 220,
                width: MediaQuery.of(context).size.width - 10,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'E-Mail',
                            isCollapsed: false,
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                        onChanged: (alinanMail) {
                          email = alinanMail;
                        },
                        validator: (alinanMail) {
                          return alinanMail!.isEmpty
                              ? "E-Mail Boş Olamaz"
                              : null;
                        },
                      ),
                    ),
                    const Divider(color: Colors.black54, height: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Şifre',
                            isCollapsed: false,
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                        onChanged: (alinanSifre) {
                          password = alinanSifre;
                        },
                        validator: (alinanSifre) {
                          return alinanSifre!.isEmpty
                              ? "Şifre Boş Olamaz"
                              : null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: MaterialButton(
                          onPressed: () {
                            kayitKontrol();
                          },
                          height: 45,
                          minWidth: 240,
                          textColor: Colors.white,
                          color: Colors.green.shade700,
                          shape: const StadiumBorder(),
                          child: const Text('Kayıt Ol', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: _dogrulamaAnahtari2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                height: 220,
                width: MediaQuery.of(context).size.width - 10,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'E-Mail',
                            isCollapsed: false,
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                        onChanged: (alinanMail) {
                          email2 = alinanMail;
                        },
                        validator: (alinanMail) {
                          return alinanMail!.isEmpty
                              ? "E-Mail Boş Olamaz"
                              : null;
                        },
                      ),
                    ),
                    const Divider(color: Colors.black54, height: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            border: InputBorder.none,
                            hintText: 'Şifre',
                            isCollapsed: false,
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                        onChanged: (alinanSifre) {
                          password2 = alinanSifre;
                        },
                        validator: (alinanSifre) {
                          return alinanSifre!.isEmpty
                              ? "Şifre Boş Olamaz"
                              : null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: MaterialButton(
                          onPressed: () {
                            kayitKontrol2();
                          },
                          height: 45,
                          minWidth: 240,
                          textColor: Colors.white,
                          color: Colors.green.shade700,
                          shape: const StadiumBorder(),
                          child: const Text('Kayıt Ol', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void kayitKontrol() {
    if (_dogrulamaAnahtari.currentState!.validate()) {
      formuTestEt(email, password);
    }
  }
  void kayitKontrol2() {
    if (_dogrulamaAnahtari2.currentState!.validate()) {
      formuTestEt(email2, password2);
    }
  }

  void formuTestEt(String email, String password) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      var isim = FirebaseAuth.instance.currentUser!.email.toString().indexOf("@");
      var name = FirebaseAuth.instance.currentUser!.email.toString().substring(0,isim);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseFirestore.instance.collection("Kullanıcılar").doc(FirebaseAuth.instance.currentUser!.displayName.toString().toLowerCase()).set({
        "Altin": "0",
        "Dolar": "0",
        "Euro": "0",
        "email": email,
        "varliklar": "0",
      });
      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    catch(e){
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: const Text("Hata"),
              content: const Text("Kayıt Için Gerekli Bilgileriniz Hatalı"),
              actions: [
                MaterialButton(child: const Text("Geri Dön"),
                    onPressed: () => Navigator.pop(context) )
              ],
            );
          });
    }
  }
}