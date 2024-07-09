import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CategoriesModel {
  final String? categoryCode;
  final String? categoryName;
  final String? categoryDescription;

  CategoriesModel(
    this.categoryCode,
    this.categoryName,
    this.categoryDescription,
  );

  CategoriesModel.fromJson(Map<String, dynamic> json)
      : categoryCode = json['categoryCode'] as String,
        categoryName = json['categoryName'] as String,
        categoryDescription = json['categoryDescription'] as String;

  Map<String, dynamic> toJson() => {
        'categoryCode': categoryCode,
        'categoryName': categoryName,
        'categoryDescription': categoryDescription,
      };
}
