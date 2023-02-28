class PageDetails {
  int? id;
  String? name;
  String? menu;
  String? shortDescription;
  String? description;
  String? image;
  PageDetails(
      {this.id,
        this.name,
        this.menu,
        this.shortDescription,
        this.description,
        this.image,
     });

  PageDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    menu = json['menu'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['menu'] = this.menu;
    data['shortDescription'] = this.shortDescription;
    data['description'] = this.description;
    data['image'] = this.image;

    return data;
  }
}
