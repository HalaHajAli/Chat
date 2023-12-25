import 'package:flutter/material.dart';
import 'package:chatt/screens/chat.dart';
import 'package:chatt/screens/signup.dart';
import 'package:chatt/screens/signin.dart';
import 'screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
   var firebaseOptions = FirebaseOptions(
    apiKey: "AIzaSyDfbUhB4GyhejGNMS6uTG7ST2S7FZDlzKo",
    authDomain: "chat-7e265.firebaseapp.com", // Replace with your authDomain
    projectId: "chat-7e265",
    storageBucket: "chat-7e265.appspot.com",
    messagingSenderId: "203365676010",
    appId: "1:203365676010:android:3642e0cd5946a9d7e5b893",
  );
  await Firebase.initializeApp(options: firebaseOptions);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MessageMe app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: ChatScreen(),
     initialRoute: _auth.currentUser!=null
     ? ChatScreen.screenRoute
     :WelcomeScreen.screenRoute,

      routes: {
          WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
          SignInScreen.screenRoute: (context) => SignInScreen(),
          RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
          ChatScreen.screenRoute: (context) => ChatScreen(),
        }
    );
  }
}