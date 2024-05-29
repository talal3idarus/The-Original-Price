import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sasa_firebase/screens/AdminScreen.dart';
import 'screens/HomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'The Original Prices'),
      // home: const AdminScreen(),
    );
  }
}