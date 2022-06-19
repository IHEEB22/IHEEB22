// ignore_for_file: non_constant_identifier_names
// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
import 'package:app1firebase/View.dart/LoginView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //bech el firebase ylodi 9bal matet7al el app.fel Firebase.initializeApp()
  runApp(
    MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text('Home')),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: defaultFirebaseAppName.currentPlatform,
        ),
        builder: (context, snapshot) {
          // snapshot.connectionState can be done ,waiting none active ...
          // switch(snapshot.connectivestate) w ba3ed 7ot 3al switch crtl + space
          switch (snapshot.connectionState) {
            case (ConnectionState.done):
              return const Text('Done');
            default:
              return const Text("loading ...");
          }
        },
      ),
    );
  }
}
