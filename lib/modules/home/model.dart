class CategoryModel {
  bool? isSuccess;
  List<Categories>? categories;

  CategoryModel({this.isSuccess, this.categories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? category;
  String? categoryImage;

  Categories({this.category, this.categoryImage});

  Categories.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
