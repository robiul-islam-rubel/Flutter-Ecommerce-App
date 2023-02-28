class FeatureCategory {
  int? Id;
  String? Name;
  String? ImagePath;


  FeatureCategory(
      {this.Id,this.Name,this.ImagePath});

  FeatureCategory.fromJson(Map<String, dynamic> json) {
    Id = json['category_id'];
    Name=json["name"];
    ImagePath=json["imagePath"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.Id;
    data["name"]=this.Name;
    data["imagePath"]=this.ImagePath;

    return data;
  }
}