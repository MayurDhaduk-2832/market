// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  bool? isSuccess;
  List<Category>? categories;

  CategoryModel({
    this.isSuccess,
    this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    isSuccess: json["isSuccess"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };

}

class Category {
  String? category;
  String? categoryImage;

  Category({
    this.category,
    this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    category: json["category"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "category_image": categoryImage,
  };
}
