// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'homescreen.dart';
import '../data/ProductModel.dart';
import '../data/DatabaseHelper.dart';
import '../reusable/DataModifier.dart';
import 'package:flutter/material.dart';
import '../reusable/AdminDetailsScreen.dart';

class AdminScreen extends StatelessWidget {

  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AdminScreen();
  }
}

class _AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<_AdminScreen> {
  late final Product? product;
  List<Product> productList = [];

  @override
  void initState() {
    final DatabaseHelper  Database= DatabaseHelper();
    super.initState();
    Database.readFirebaseRealtimeDBMain((productsList) {
      setState(() {
        productList = productsList;
        // print(productList[0]["starRating"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Text(
          'Admin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
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
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(title: "HOME")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("E X I T"),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [

        Container(
        color: Colors.white,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: Dr.Hitham",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Optional spacing between the company name and the rest of the content
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        "ID: 2578",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Number: \n9330 0733",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(color: Colors.teal.shade900, width: 4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://yt3.googleusercontent.com/ytc/AIdro_kVRPNqibvYQZo06U44TS7WX5bAtR_cggzHRyUVgObAj9Y=s160-c-k-c0x00ffffff-no-rj',
                      height: 130,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),




      Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    "All Products",
                    style: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),




                SizedBox(
                  width: 180,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1.2,// Set the button to be half the width of its parent
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataModifier(isUpdate: false),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text(
                        'Insert',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 4,
              width: 5,
              color: Colors.teal[900],
            ),
          ),

          for (int i = 0; i < productList.length; i++)
            AdminDetailsScreen(product: productList[i]),

          Image.asset("images/logo.png", height: 200,),
        ],
      ),
    );
  }


}
