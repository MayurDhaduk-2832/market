import 'dart:convert';

ProductDataModel productDataModelFromJson(String str) =>
    ProductDataModel.fromJson(json.decode(str));

String productDataModelToJson(ProductDataModel data) =>
    json.encode(data.toJson());

class ProductDataModel {
  bool? isSuccess;
  List<Datum>? data;

  ProductDataModel({
    this.isSuccess,
    this.data,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        isSuccess: json["isSuccess"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? userId;
  String? imageId;
  String? sellerBrandName;
  String? productName;
  String? originalPrice;
  String? salePrice;
  String? productDescription;
  String? latitude;
  String? longitude;
  String? distance;

  Datum({
     this.id,
     this.userId,
     this.imageId,
     this.sellerBrandName,
     this.productName,
     this.originalPrice,
     this.salePrice,
     this.productDescription,
     this.latitude,
     this.longitude,
     this.distance,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["userId"],
    imageId: json["image_id"],
    sellerBrandName: json["seller_brand_name"],
    productName: json["product_name"],
    originalPrice: json["original_price"],
    salePrice: json["sale_price"],
    productDescription: json["product_description"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "image_id": imageId,
    "seller_brand_name": sellerBrandName,
    "product_name": productName,
    "original_price": originalPrice,
    "sale_price": salePrice,
    "product_description": productDescription,
    "latitude": latitude,
    "longitude": longitude,
    "distance": distance,
  };
}
