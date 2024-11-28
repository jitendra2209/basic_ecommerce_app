class APIResponse {
  bool? success;
  String? message;
  ProductData? data;

  APIResponse({this.success, this.message, this.data});

  APIResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ProductData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductData {
  List<Products>? products;
  Products? product;
  int? totalCount;

  ProductData({this.products, this.totalCount});

  ProductData.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }

    if (json['product'] is Map) {
      product = Products.fromJson(json['product']);
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = totalCount;
    return data;
  }
}

class Products {
  String? sId;
  String? name;
  int? price;
  int? rating;
  String? createdAt;
  String? updatedAt;
  bool? isAvailable;
  String? type;
  int? returnPeriod;
  String? seller;
  int? expectedDelivery;
  String? image;
  List<dynamic>? favorite;

  Products(
      {this.sId,
      this.name,
      this.price,
      this.rating,
      this.createdAt,
      this.updatedAt,
      this.isAvailable,
      this.type,
      this.returnPeriod,
      this.seller,
      this.expectedDelivery,
      this.image,
      this.favorite});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isAvailable = json['is_available'];
    type = json['type'];
    returnPeriod = json['return_period'];
    seller = json['seller'];
    expectedDelivery = json['expected_delivery'];
    image = json['image'];
    if (json['favorite'] != null) {
      favorite = [];
      json['favorite'].forEach((v) {
        favorite!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['rating'] = rating;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['is_available'] = isAvailable;
    data['type'] = type;
    data['return_period'] = returnPeriod;
    data['seller'] = seller;
    data['expected_delivery'] = expectedDelivery;
    data['image'] = image;
    if (favorite != null) {
      data['favorite'] = favorite!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
