// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  bool? success;
  List<SliderModel>? sliders;
  List<Category>? categories;
  List<Product>? featuredProducts;
  List<Product>? bestOffersProducts;

  HomeResponse({
    this.success,
    this.sliders,
    this.categories,
    this.featuredProducts,
    this.bestOffersProducts,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    success: json["success"],
    sliders:
        json["sliders"] == null
            ? []
            : List<SliderModel>.from(
              json["sliders"].map((x) => SliderModel.fromJson(x)),
            ),
    categories:
        json["categories"] == null
            ? []
            : List<Category>.from(
              json["categories"].map((x) => Category.fromJson(x)),
            ),
    featuredProducts:
        json["featured_products"] == null
            ? []
            : List<Product>.from(
              json["featured_products"].map((x) => Product.fromJson(x)),
            ),
    bestOffersProducts:
        json["best_offers_products"] == null
            ? []
            : List<Product>.from(
              json["best_offers_products"].map((x) => Product.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "sliders":
        sliders == null
            ? []
            : List<dynamic>.from(sliders!.map((x) => x.toJson())),
    "categories":
        categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "featured_products":
        featuredProducts == null
            ? []
            : List<dynamic>.from(featuredProducts!.map((x) => x.toJson())),
    "best_offers_products":
        bestOffersProducts == null
            ? []
            : List<dynamic>.from(bestOffersProducts!.map((x) => x.toJson())),
  };
}

class SliderModel {
  int? id;
  String? image;

  SliderModel({this.id, this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      SliderModel(id: json["id"], image: json["image"]);

  Map<String, dynamic> toJson() => {"id": id, "image": image};
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["id"], name: json["name"], image: json["image"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "image": image};
}

class Product {
  int? id;
  String? name;
  double? price;
  double? costPrice;
  bool? inStock;
  String? category;
  String? mainImage;

  Product({
    this.id,
    this.name,
    this.price,
    this.costPrice,
    this.inStock,
    this.category,
    this.mainImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price:
        (json["price"] is int)
            ? (json["price"] as int).toDouble()
            : json["price"],
    costPrice:
        json["cost_price"] == null
            ? null
            : (json["cost_price"] is int)
            ? (json["cost_price"] as int).toDouble()
            : json["cost_price"],
    inStock: json["in_stock"],
    category: json["category"],
    mainImage: json["main_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "cost_price": costPrice,
    "in_stock": inStock,
    "category": category,
    "main_image": mainImage,
  };
}
