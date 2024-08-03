import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "details")
  String? details;

  @JsonKey(name: "features")
  String? features;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "image")
  List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.details,
    required this.features,
    required this.price,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
