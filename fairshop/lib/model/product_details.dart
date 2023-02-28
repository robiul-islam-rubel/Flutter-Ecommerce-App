class ProductDetails {
  int? productId;
  String? name;
  int? quantity;
  String? price;

  String? category;
  int? categoryId;
  String? brand;
  int? brandId;
  String? unitName;
  bool? quantityApplicable;

  int? maxQuantity;
  String? imagePath;


  ProductDetails(
      {this.productId,
        this.name,
        this.quantity,
        this.price,

        this.category,
        this.categoryId,
        this.brand,
        this.brandId,

        this.unitName,
        this.quantityApplicable,

        this.maxQuantity,
        this.imagePath,
       });

  ProductDetails.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    category = json['category'];
    categoryId = json['categoryId'];
    brand = json['brand'];
    brandId = json['brandId'];
    unitName = json['unitName'];
    quantityApplicable = json['quantityApplicable'];
    maxQuantity = json['maxQuantity'];
    imagePath = json['imagePath'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;

    data['category'] = this.category;
    data['categoryId'] = this.categoryId;
    data['brand'] = this.brand;
    data['brandId'] = this.brandId;

    data['unitName'] = this.unitName;
    data['quantityApplicable'] = this.quantityApplicable;

    data['maxQuantity'] = this.maxQuantity;
    data['imagePath'] = this.imagePath;

    return data;
  }
}

class Gallery {
  int? imageId;
  String? imagePath;

  Gallery({this.imageId, this.imagePath});

  Gallery.fromJson(Map<String, dynamic> json) {
    imageId = json['imageId'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageId'] = this.imageId;
    data['imagePath'] = this.imagePath;
    return data;
  }
}