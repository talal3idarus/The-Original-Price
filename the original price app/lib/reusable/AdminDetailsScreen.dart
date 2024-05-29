import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/DatabaseHelper.dart';
import '../data/ProductModel.dart';
import '../reusable/DataModifier.dart';
import '../screens/AdminScreen.dart';

class AdminDetailsScreen extends StatelessWidget {
  final Product? product;
  final DatabaseHelper database = DatabaseHelper();

  final TextStyle headlineStyle1 = const TextStyle(
      fontSize: 26, fontWeight: FontWeight.bold, color: Colors.brown);
  final TextStyle headlineStyle2 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown);

  AdminDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 15,
          surfaceTintColor: Colors.transparent,
          child: Container(
            height: 155,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image on the left side
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 200,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 1),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          product?.productData?.image.toString() ?? '',
                        ),
                      ),
                    ),
                  ),
                ),

                // Name, update, and delete on the right side
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      // Product name with ellipsis
                      Expanded(
                        child: Text(
                          product?.productData?.name.toString() ?? '',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Spacer between name and buttons
                      SizedBox(height: 8),

                      // Update and Delete buttons in the same row
                      Row(
                        children: [
                          // Update button
                          SizedBox(width:50),
                          SizedBox(
                            width: screenWidth * 0.3, // 40% of screen width
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DataModifier(
                                      isUpdate: true,
                                      product: product,
                                    ),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.green),
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.white),
                              ),
                              child: Text('Update',style: TextStyle(fontSize: 20)),
                            ),
                          ),

                          // Spacer between buttons
                          SizedBox(width: 8),

                          // Delete button
                          SizedBox(
                            width: screenWidth * 0.3, // 40% of screen width
                            child: ElevatedButton(
                              onPressed: () => _DeleteProduct(context, product!),
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                                foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                              ),
                              child: Text('Delete',style: TextStyle(fontSize: 20),),
                            ),
                          ),
                        ],
                      ),SizedBox(height: 10,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}



_DeleteProduct(BuildContext context, Product product) {
  final DatabaseHelper  Database= DatabaseHelper();
  if (product.key != null && product.productData?.name != null) {
    String productName = product.productData!.name!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete the product $productName?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              onPressed: (){
                Database.DeleteProduct(product.key!);
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$productName product deleted')),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminScreen()),
                      (Route<dynamic> route) => false,
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

