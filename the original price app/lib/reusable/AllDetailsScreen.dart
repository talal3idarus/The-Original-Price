import 'package:flutter/material.dart';
import '../data/ProductModel.dart';
import '../screens/ProductsDetailsScreen.dart';

class AllDetailsScreen extends StatelessWidget {
  final Product? product;


  final TextStyle headlineStyle1 = const TextStyle(
      fontSize: 26, fontWeight: FontWeight.bold, color: Colors.brown);
  final TextStyle headlineStyle2 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown);
  const AllDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsDetailsScreen(product: product!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 18,
          surfaceTintColor: Colors.transparent,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                bottom: BorderSide(color: Colors.black, width: 2),
              ),
              color: Colors.white12,
            ),

            child: Column(

              children: [

                //the fram for the image==========================================
                Container(
                  height:250, // Set the height of the image to 100
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2),
                    image: DecorationImage(
                      fit: BoxFit.contain, // Maintain aspect ratio while covering
                      image: NetworkImage(
                        product?.productData?.image.toString() ?? '',
                      ),
                    ),
                  ),
                ),



                //the fram for the name.==========================================
                SizedBox(height: 10), // Add space between image and name
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    product?.productData?.name.toString() ?? '',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
