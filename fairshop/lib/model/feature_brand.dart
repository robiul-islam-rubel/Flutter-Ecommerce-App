class FeatureBrand {
  int? Id;
  String? Name;
  String? ImagePath;


  FeatureBrand(
      {this.Id,this.Name,this.ImagePath});

  FeatureBrand.fromJson(Map<String, dynamic> json) {
    Id = json['brand_id'];
    Name=json["name"];
    ImagePath=json["imagePath"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.Id;
    data["name"]=this.Name;
    data["imagePath"]=this.ImagePath;

    return data;
  }
}