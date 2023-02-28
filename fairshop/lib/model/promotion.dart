class Promotion {
  int? Id;
  String? Name;
  String? ImagePath;


  Promotion(
      {this.Id,this.Name,this.ImagePath});

  Promotion.fromJson(Map<String, dynamic> json) {
    Id = json['promotion_id'];
    Name=json["name"];
    ImagePath=json["imagePath"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promotion_id'] = this.Id;
    data["name"]=this.Name;
    data["imagePath"]=this.ImagePath;

    return data;
  }
}