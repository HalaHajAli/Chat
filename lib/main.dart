import 'package:flutter/material.dart';
import 'package:chatt/screens/chat.dart';
import 'package:chatt/screens/signup.dart';
import 'package:chatt/screens/signin.dart';
import 'package:chatt/screens/login1.dart';
import 'screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chatt/screens/try.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatt/screens/CartProvider.dart';
import 'package:chatt/screens/favorites_provider.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:get/get.dart';
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

    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()), // Provide your CartProvider
        // You can add more providers if needed
      ],
      child: GetMaterialApp(
      title: 'MessageMe app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: RegistrationScreen(),
    // initialRoute: _auth.currentUser!=null
     //? ChatScreen.screenRoute
     //:WelcomeScreen.screenRoute,

      routes: {
          WelcomePage.screenRoute: (context) => WelcomePage(),
          SignInScreen.screenRoute: (context) => SignInScreen(),
          RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
          ChatScreen.screenRoute: (context) => ChatScreen(),
        }
      )
    );
  }
}