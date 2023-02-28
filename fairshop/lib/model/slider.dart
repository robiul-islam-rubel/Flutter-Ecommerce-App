class HomeSlider {
  int? id;
  String? name;
  String? url;
  String? imagePath;

  HomeSlider(
      {this.id, this.name, this.url, this.imagePath}
      );

  HomeSlider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['imagePath'] = this.imagePath;
    return data;
  }
}