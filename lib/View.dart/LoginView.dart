import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// qjcqcjqcjlscqkjckjqaaaaaaaaaaaaa
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _Email;
  late final TextEditingController _Password;

  @override
  void initState() {
    _Email = TextEditingController();
    _Password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _Email.dispose();
    _Password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: (const Text('Login UI')),
          ),
          body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              // snapshot.connectionState can be done ,waiting none active ...
              // switch(snapshot.connectivestate) w ba3ed 7ot 3al switch crtl + space
              switch (snapshot.connectionState) {
                case (ConnectionState.done):
                  return Column(children: [
                    TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: _Email,
                      decoration: const InputDecoration(
                          hintText: 'enter your Email here'),
                    ),
                    TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _Password,
                      decoration: const InputDecoration(
                          hintText: 'enter your Password here'),
                    ),
                    TextButton(
                        onPressed: () async {
                          final Email = _Email.text;
                          final Password = _Password.text;
                          try {

                          final UserCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: Email, password: Password);
                          print(UserCredential);
                          } on FirebaseAuth catch   (e)
                          print(e);
s                        },
                        child: const Text('Login'))
                  ]);
                  ;
                default:
                  return const Text("loading ...");
              }
            },
          ),
        ));
  }
}
