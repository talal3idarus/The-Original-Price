// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import '../screens/homescreen.dart';
import '../screens/AdminScreen.dart';
import 'package:flutter/material.dart';
import '../data/Auth.dart';

class AdminLoginScreen extends StatefulWidget {
  AdminLoginScreen({super.key});
  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  Auth auth = Auth();
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? loader = false;
  String? errorMessage = '';
  bool isLogin = true;

  Future<void> login() async {
    errorMessage = '';

    setState(() {
      loader = true;
    });

    try {
      await Auth().signInWithEmailAndPassword(
          email: email.text, password: passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        errorMessage = 'Invalid credential';
      }
    } catch (e) {
      print(e);
      errorMessage = 'Invalid credential';
    }

    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: loader!? Center(child: CircularProgressIndicator()): Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Icon(Icons.lock, size: 120, color: Colors.teal[900]),
              SizedBox(height: 30),
              Text(
                "Welcome Back Admin",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 45),
              if (errorMessage != null && errorMessage!.isNotEmpty)
                Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16),
              // Input For Email =====================================
              TextField(
                controller: email,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              // Input For Password  =================================
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: login,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
