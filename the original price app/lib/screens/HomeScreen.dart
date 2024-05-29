// ignore_for_file: sized_box_for_whitespace
import 'dart:io';
import 'package:flutter/material.dart';
import '../data/DatabaseHelper.dart';
import '../data/ProductModel.dart';
import '../reusable/MyProductInfo.dart';
import 'AdminLoginScreen.dart';
import 'ViewAllScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = [];
  @override
  void initState() {
    super.initState();
    final DatabaseHelper  Database= DatabaseHelper();
    Database.readFirebaseRealtimeDBMain((productsList) {
      setState(() {
        productList = productsList;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 100,
        centerTitle: true,
        title: Image.asset("images/logo.png", height: 100,),

      ),



      drawer:  Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.scaleDown,
                ),
              ),
              child: null,
            ),
            ListTile(
              leading: Icon(Icons.home,),
              title: Text("H O M E"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(title: '',),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.admin_panel_settings,
              ),
              title: Text("A D M I N"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminLoginScreen(),
                  ),
                );
              },
            ),


            ListTile(
              leading: Icon(Icons.logout,
              ),
              title: Text("E X I T"),
              onTap: () {
                exit(0);
              },
            ),

          ],
        ),
      ),




      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          //header title as : Categories.---------------------------------------
          Container(
            height: 60,
            // color: Colors.white,
            child: const Center(
              child: Text("Categories",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

//=============================================================================
          // the start of the body: --------------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              child: const Text(
                "Mobile Devices:",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // Filter the productList to include only mobile devices
                for (int i = 0; i < productList.length; i++)
                  if (productList[i].productData?.type == "mobile")
                    MyProductInfo(product: productList[i]),
              ],
            ),
          ),
//=============================================================================



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Container(
              height: 2,
              color: Colors.teal[900],
            ),
          ),


          SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              child: const Text(
                "Laptops:",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < productList.length; i++)
                  if (productList[i].productData?.type == "laptop")
                    MyProductInfo(product: productList[i]),
              ],
            ),
          ),

//=============================================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Container(
              height: 2,
              color: Colors.teal[900],
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 35,
              child: const Text(
                "Others Devices:",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 350,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < productList.length; i++)
                  if (productList[i].productData?.type == "others")
                    MyProductInfo(product: productList[i]),
              ],
            ),
          ),

//=============================================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Container(
              height: 2,
              color: Colors.teal[900],
            ),
          ),
          const SizedBox(height: 10),


          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewAllScreen(title: '',), // Replace ViewWallPage with your actual page name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE6F1F2), // Set the background color here
              ),
              child: Text(
                'View ALL',
                style: TextStyle(fontSize: 28,color: Colors.teal[900],), // Adjust the fontSize as needed
              ),
            ),
          ),
        ],

      ),
    );

  }
}
