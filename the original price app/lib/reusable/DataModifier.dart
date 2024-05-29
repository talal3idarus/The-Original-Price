import 'package:flutter/material.dart';
import '../data/DatabaseHelper.dart';
import '../data/ProductModel.dart';
import '../screens/AdminScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DataModifier extends StatefulWidget {
  final bool isUpdate;
  final Product? product;

  const DataModifier({
    Key? key,
    required this.isUpdate,
    this.product,
  }) : super(key: key);

  @override
  _DataModifierState createState() => _DataModifierState();
}

class _DataModifierState extends State<DataModifier> {
  final _formKey = GlobalKey<FormState>();
  final _brandController = TextEditingController();
  final _imageController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String? _typeController = "others";

  final DatabaseHelper Database = DatabaseHelper();
  double? rating = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate && widget.product != null) {
      _nameController.text = widget.product!.productData?.name ?? '';
      _imageController.text = widget.product!.productData?.image ?? '';
      _brandController.text = widget.product!.productData?.brand.toString() ?? '';
      _priceController.text = widget.product!.productData?.price ?? '';
      rating = (widget.product!.productData?.starRating ?? 0.0) as double?;
      _typeController = widget.product!.productData?.type ?? 'others';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[900],
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              SizedBox(height: 50),
              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(
                  labelText: 'Brand',
                  hintText: "Company name",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Company Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Product Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Product Price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _typeController,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
                onChanged: (String? newValue) => setState(() => _typeController = newValue!),
                items: <String>[
                  'mobile',
                  'laptop',
                  'others',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'Image',
                  hintText: "Enter a Link",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Image Link';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              Text(
                'Star Rating:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBar.builder(
                initialRating: rating ?? 0.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (r) {
                  rating = r;
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  widget.isUpdate ? "Update" : "Add",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ProductData productData = ProductData(
        brand: _brandController.text,
        image: _imageController.text,
        name: _nameController.text,
        price: _priceController.text,
        type: _typeController,
        starRating: rating ?? 0.0,
      );

      if (widget.isUpdate) {
        Database.UpdateProductData(widget.product!.key!, productData);
        _showAlertDialog(context, "Success", "Product updated successfully!");
      } else {
        Database.AddNewProduct(productData);
        _showAlertDialog(context, "Success", "Product added successfully!");
      }
    }
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _brandController.dispose();
    _imageController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
