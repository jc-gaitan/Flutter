import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.name,
    required this.br,
    required this.price,
    required this.quantityE,
    required this.quantitySold,
    required this.photoUrl,
  });

  String name;
  String br;
  String price;
  String quantityE;
  String quantitySold;
  String photoUrl;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        br: json["br"],
        price: json["price"],
        quantityE: json["quantityE"],
        quantitySold: json["quantitySold"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "br": br,
        "price": price,
        "quantityE": quantityE,
        "quantitySold": quantitySold,
        "photoUrl": photoUrl,
      };
}
