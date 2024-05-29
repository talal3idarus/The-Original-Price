// Importing Firebase database utilities for real-time data interaction.
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'ProductModel.dart';
// https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-11/iphone-11-red-back.jpg
class DatabaseHelper {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
   Future<void> DeleteProduct(String key) async {
    await databaseReference.child("Products").child(key).remove();
  }



   void readFirebaseRealtimeDBMain(
      Function(List<Product>) productListCallback) {
    databaseReference.child("Products").onValue.listen((productDataJson) {
      if (productDataJson.snapshot.exists) {
        ProductData productData;
        Product product;
        List<Product> productList = [];
        productDataJson.snapshot.children.forEach((element) {
          productData = ProductData.fromJson(element.value as Map);
          product = Product(element.key, productData);
          productList.add(product);
        });
        productListCallback(productList);
      } else {
        print("The data snapshot does not exist!");
      }
    });
  }


  Future<void> UpdateProductData(String id, ProductData productData) async {
    Map<String, dynamic> data = productData.toJson();
    print(data);
    await databaseReference.child('Products').child(id).update(data);
  }



  Future<void> AddNewProduct( ProductData productData) async {
    Map<String, dynamic> data = productData.toJson();
    await databaseReference.child('Products').push().set(data);
  }

}
