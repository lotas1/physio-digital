import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "details")
  String details;

  @JsonKey(name: "features")
  String features;

  @JsonKey(name: "price", fromJson: _priceFromJson, toJson: _priceToJson)
  String price;

  static String _priceFromJson(dynamic value) => value?.toString() ?? '';
  static dynamic _priceToJson(String value) => double.tryParse(value) ?? 0.0;

  @JsonKey(name: "image")
  List<String> images;

  static const String defaultImage = 'assets/images/default_product_image.jpg';

  Product({
    required this.id,
    required this.name,
    required this.details,
    required this.features,
    required this.price,
    required List<String> images,
  }) : images = images.isNotEmpty ? images : [defaultImage];

  factory Product.fromJson(Map<String, dynamic> json) {
    var product = _$ProductFromJson(json);
    if (product.images.isEmpty) {
      product.images = [defaultImage];
    }
    return product;
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}