class Cart {
  int? productId;
  int? itemId;
  String? name;
  int? quantity;
  String? price;
  String? discountPrice;
  int? categoryId;
  String? category;
  int? brandId;
  String? brand;
  int? discountId;
  String? discount;
  String? discountType;
  String? discountAmount;
  int? promotionId;
  String? promotion;
  int? tagId;
  String? tag;
  String? unitName;
  bool? quantityApplicable;
  int? maxQuantity;
  String? imagePath;

  Cart(
      {this.productId,
        this.itemId,
        this.name,
        this.quantity,
        this.price,
        this.discountPrice,
        this.categoryId,
        this.category,
        this.brandId,
        this.brand,
        this.discountId,
        this.discount,
        this.discountType,
        this.discountAmount,
        this.promotionId,
        this.promotion,
        this.tagId,
        this.tag,
        this.unitName,
        this.quantityApplicable,
        this.maxQuantity,
        this.imagePath});

  Cart.fromMap(Map<String, dynamic> json) {
    productId = json['product_id'];
    itemId = json['item_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    discountPrice = json['discountPrice'];
    categoryId = json['categoryId'];
    category = json['category'];
    brandId = json['brandId'];
    brand = json['brand'];
    discountId = json['discountId'];
    discount = json['discount'];
    discountType = json['discountType'];
    discountAmount = json['discountAmount'];
    promotionId = json['promotionId'];
    promotion = json['promotion'];
    tagId = json['tagId'];
    tag = json['tag'];
    unitName = json['unitName'];
    quantityApplicable = json['quantityApplicable'];
    maxQuantity = json['maxQuantity'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['item_id'] = this.itemId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['discountPrice'] = this.discountPrice;
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    data['brandId'] = this.brandId;
    data['brand'] = this.brand;
    data['discountId'] = this.discountId;
    data['discount'] = this.discount;
    data['discountType'] = this.discountType;
    data['discountAmount'] = this.discountAmount;
    data['promotionId'] = this.promotionId;
    data['promotion'] = this.promotion;
    data['tagId'] = this.tagId;
    data['tag'] = this.tag;
    data['unitName'] = this.unitName;
    data['quantityApplicable'] = this.quantityApplicable;
    data['maxQuantity'] = this.maxQuantity;
    data['imagePath'] = this.imagePath;
    return data;
  }
}
