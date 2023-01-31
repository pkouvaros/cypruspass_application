import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CyprusPass());
}

class CyprusPass extends StatelessWidget {
  const CyprusPass({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyprusPass',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'CyprusPass'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer filterTimer;
  late Timer logoTimer;
  double filterOpacity = 1.0;
  double logoOpacity = 0.0;
  static const int animationDuration = 1500;

  @override
  void initState() {
    filterTimer = Timer(const Duration(milliseconds: 10),
        () => setState(() => filterOpacity = 0.8));
    logoTimer = Timer(const Duration(milliseconds: 10 + animationDuration),
        () => setState(() => logoOpacity = 1.0));
    super.initState();
    super.initState();
  }

  signalAnimation() {
    filterOpacity = 0.8;
    logoOpacity = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // ignore: prefer_const_constructors
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: filterOpacity,
          duration: const Duration(milliseconds: animationDuration),
          child: Container(
            color: const Color.fromRGBO(4, 10, 51, 0.975),
          ),
        ),
        Center(
          child: AnimatedOpacity(
            opacity: logoOpacity,
            duration: const Duration(milliseconds: 500),
            child: SvgPicture.asset(
              'assets/images/logo/logo.svg',
              color: const Color.fromRGBO(245, 112, 15, 1.0),
              semanticsLabel: 'CyprusPass Logo',
            ),
          ),
        ),
      ],
    );
  }
}
