// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import '../data/ProductModel.dart';
import '../data/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import '../reusable/AllDetailsScreen.dart';
import 'ProductsDetailsScreen.dart';



class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen ({super.key, required this.title});
  final String title;


  // Creating the state for this StatefulWidget.
  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}



class _ViewAllScreenState extends State<ViewAllScreen> {
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


      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 100,
        centerTitle: true,
        title: Image.asset("images/logo.png", height: 100,),
      ),





      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          var product = productList[index];
          return ListTile(
              leading: Container(
              width: 70,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width:2),
                borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(product.productData?.image.toString() ?? '', fit: BoxFit.cover),

                ),

            title: Text(product.productData?.name.toString() ?? '',),
            subtitle: Text('brand: ${product.productData?.brand.toString() ?? ''}, Price: ${product.productData?.price.toString() ?? ''} OMR'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsDetailsScreen(product: product),
                ),
              );
            },
          );
        },
      ),




    );



  }
}
