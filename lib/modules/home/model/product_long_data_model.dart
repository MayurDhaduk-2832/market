import 'dart:convert';

ProductLongDataModel productLongDataModelFromJson(String str) =>
    ProductLongDataModel.fromJson(json.decode(str));

String productLongDataModelToJson(ProductLongDataModel data) =>
    json.encode(data.toJson());

class ProductLongDataModel {
  bool? isSuccess;
  List<DatuLong>? data;

  ProductLongDataModel({
    this.isSuccess,
    this.data,
  });

  factory ProductLongDataModel.fromJson(Map<String, dynamic> json) =>
      ProductLongDataModel(
        isSuccess: json["isSuccess"],
        data: List<DatuLong>.from(json["data"].map((x) => DatuLong.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatuLong {
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

  DatuLong({
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

  factory DatuLong.fromJson(Map<String, dynamic> json) => DatuLong(
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
