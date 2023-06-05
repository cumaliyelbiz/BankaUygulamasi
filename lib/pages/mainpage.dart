import 'package:bankauygulamasi/pages/homepage.dart';
import 'package:bankauygulamasi/pages/navbarpages/dahafazlapage.dart';
import 'package:bankauygulamasi/pages/navbarpages/hesaplapage.dart';
import 'package:bankauygulamasi/pages/navbarpages/musteriol.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bankauygulamasi/pages/navbarpages/kurlarpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String email = "", password = "";
  int selectedIndex = 0;
  final _dogrulamaAnahtari = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      const KurlarPage(),
      const HesaplaPage(),
      const MusteriOlPage(),
      const DahaFazlaPage(),
      //<Widget>[]HomePage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "                              X Bank",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            splashColor: const Color.fromRGBO(150, 150, 150, 1),
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("Bildirim"),
                      content: const Text("Bildiriminiz Bulunmamaktadır."),
                      actions: [
                        MaterialButton(child: const Text("Kapat"),
                            onPressed: () => Navigator.pop(context) )
                      ],
                    );
                  });
              /*
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BildirimPage(),
                ),
              );
               */
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.black45,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              backgroundColor: Color.fromRGBO(150, 150, 150, 0.3),
              radius: 50,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Color.fromRGBO(150, 150, 150, 1),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Hoş geldiniz",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 252,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              child: Form(
                key: _dogrulamaAnahtari,
                child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (alinanMail) {
                      return alinanMail!.isEmpty
                          ? "E-Mail Boş Olamaz"
                          : null;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        hintText: 'E-Mail',
                        isCollapsed: false,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                    onChanged: (alinanMail){
                      email = alinanMail;
                    },
                  ),
                  const Divider(color: Colors.black54, height: 1),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: (alinanSifre){
                      return alinanSifre!.length >= 6
                          ? null
                          : "Şifre En Az 6 Karakter Olmalıdır!";
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: InputBorder.none,
                        hintText: 'Şifre',
                        isCollapsed: false,
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey)
                    ),
                    onChanged: (alinanSifre){
                      password = alinanSifre;
                    },
                  ),
                  const SizedBox(height: 15),
                  /// LOGIN BUTTON
                  MaterialButton(
                    onPressed: () {
                      girisKontrol();
                    },
                    height: 45,
                    minWidth: 240,
                    textColor: Colors.white,
                    color: Colors.green.shade700,
                    shape: const StadiumBorder(),
                    child: const Text('Giriş Yap', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MusteriOlPage(),
                        ),
                      );
                    },
                      child: const Text("Hesabım Yok")),
                ],
              ),
            ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex, //New

        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,

        //unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.currency_exchange,
              ),
              label: "Kurlar"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
              ),
              label: "Hesapla"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_outlined), label: "Müsteri Ol"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Daha Fazla"),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => widgetOptions[selectedIndex]));
            //selectedIndex = index;
          });
        },
      ),
    );
  }
  void girisKontrol() {
    if(_dogrulamaAnahtari.currentState!.validate())
      {
        girisYap(email,password);
      }
  }
  void girisYap(String email, String password) async {
    try{
      final yetki = FirebaseAuth.instance;
      await yetki.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      var isim = FirebaseAuth.instance.currentUser!.email.toString().indexOf("@");
      var name = FirebaseAuth.instance.currentUser!.email.toString().substring(0,isim);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    }
    catch(e){
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: const Text("Hata"),
              content: const Text("Giriş Bilgileriniz Hatalı"),
              actions: [
                MaterialButton(child: const Text("Geri Dön"),
                    onPressed: () => Navigator.pop(context) )
              ],
            );
          });
    }
  }
}

/*
if(_dogrulamaAnahtari.currentState!.validate())
                      {
                        _dogrulamaAnahtari.currentState!.save();
                        if(email=="cumali" && password == "123456")
                        {
                          debugPrint("Giriş Başarılı !");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        }
                        else{
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: const Text("Hata"),
                                  content: const Text("Giriş Bilgileriniz Hatalı"),
                                  actions: [
                                    MaterialButton(child: const Text("Geri Dön"),
                                        onPressed: () => Navigator.pop(context) )
                                  ],
                                );
                              });
                        }
                      }
*/