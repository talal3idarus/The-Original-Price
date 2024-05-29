import 'package:flutter/material.dart';
import '../data/DatabaseHelper.dart';
import '../data/ProductModel.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final Product? product;

  const ProductsDetailsScreen({Key? key, required this.product});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  final TextStyle headlineStyle1 = const TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final TextStyle headlineStyle2 = const TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  Widget buildDataRow(String label, String data) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label + ":",
            style: headlineStyle1,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            data,
            style: headlineStyle2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Product Details',
            style: TextStyle(fontSize: 50),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 50, // adjust the size here
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            Center(
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.teal.shade700, width: 5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.product?.productData?.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),

            buildDataRow("Name", widget.product?.productData?.name ?? 'N/A'),
            const SizedBox(height: 20),
            buildDataRow("Brand", widget.product?.productData?.brand ?? 'N/A'),
            const SizedBox(height: 20),
            buildDataRow("Price", (widget.product?.productData?.price ?? 'N/A') + " OMR"),
            const SizedBox(height: 20),
            buildDataRow("Rating", (widget.product?.productData?.starRating ?? 'N/A').toString()),
          ],
        ),
      ),
    );
  }
}
