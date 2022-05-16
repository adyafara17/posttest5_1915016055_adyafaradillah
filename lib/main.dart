import 'package:flutter/material.dart';
import 'package:flutter_application_1/form.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
    );
  }
}

Widget gambar() {
  return Container(
    width: 200,
    height: 200,
    padding: const EdgeInsets.all(4.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset('assets/logo.jpg'),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  static final List<Widget> _pages = [
    HomePage(),
    formPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // var pages = _pages;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: _index == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
                label: "Booking",
                icon: _index == 0
                    ? Icon(Icons.payment)
                    : Icon(Icons.payment_outlined)),
          ],
        ),
        body: _pages.elementAt(_index),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(234, 67, 3, 3),
        // margin: EdgeInsets.all(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                // padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  '-Pencucian Mobil- ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Color.fromARGB(220, 240, 225, 151),
                  ),
                ),
              ),
              gambar(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MainPage()));
                },
                child: Text("Masuk"),
              ),
            ]),
      ),
    );
  }
}
