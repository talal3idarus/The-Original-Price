// Class representing a Product with optional properties.
class Product {
  String? key;
  ProductData? productData;

  Product(this.key, this.productData);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['key'],
      ProductData.fromJson(json['productData']),
    );
  }
}

class ProductData {
  String? image;
  String? name;
  String? brand;
  String? price;
  double? starRating;
  String? type;

  ProductData({
    this.image,
    this.name,
    this.brand,
    this.price,
    this.starRating,
    this.type,
  });

  factory ProductData.fromJson(Map<dynamic, dynamic> json) {
    return ProductData(
      image: json["image"],
      name: json["name"],
      brand: json["brand"],
      price: json["price"],
      // starRating:json["starRating"].toDouble(),
      type: json["type"],

      starRating: _checkDouble(json['starRating']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'brand': brand,
      'price': price,
      'starRating': starRating,
      'type':type,
    };
  }


}
double? _checkDouble(value) {
  if (value is String) {
    return double.tryParse(value);
  } else if (value is double) {
    return value;
  } else if (value is int) {
    return value.toDouble();
  } else {
    return null;
  }
}