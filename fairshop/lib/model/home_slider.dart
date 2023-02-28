class HomeSlider {
  int? Id;
  String? Name;
  String? Url;
  String? ImagePath;


  HomeSlider(
      {this.Id,this.Name,this.Url,this.ImagePath});

  HomeSlider.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Name=json["name"];
    ImagePath=json["imagePath"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.Id;
    data["name"]=this.Name;
    data["url"]=this.Url;
    data["imagePath"]=this.ImagePath;

    return data;
  }
}