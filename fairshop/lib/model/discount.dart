class Discount {
  int? Id;
  String? Name;
  String? ImagePath;


  Discount(
      {this.Id,this.Name,this.ImagePath});

  Discount.fromJson(Map<String, dynamic> json) {
    Id = json['discount_id'];
    Name=json["name"];
    ImagePath=json["imagePath"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount_id'] = this.Id;
    data["name"]=this.Name;
    data["imagePath"]=this.ImagePath;

    return data;
  }
}