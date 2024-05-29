import '../data/ProductModel.dart';
import 'package:flutter/material.dart';
import '../screens/ProductsDetailsScreen.dart';

class MyProductInfo extends StatelessWidget {
  final Product? product;

  const MyProductInfo({Key? key, this.product}) : super(key: key);

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

      //the Fram for the Card ==================================================
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 10,
          surfaceTintColor: Colors.transparent,
          child: Container(
            width: 260,
            // height: 350,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal.shade900, width: 3),
              color: Colors.white12,
            ),

            child: Column(

              children: [

                //the Fram for the image========================================
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        product?.productData?.image.toString() ?? '',
                      ),
                    ),
                  ),
                ),



                //the fram for the text.========================================
                const SizedBox(height: 30),

                // Add space between image and name
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    product?.productData?.name.toString() ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      overflow: TextOverflow.ellipsis,
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
