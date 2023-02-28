class OrderLocation {
  int? Id;
  String? Name;
  OrderLocation(
      {this.Id,this.Name});

  OrderLocation.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Name=json["name"];


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.Id;
    data["name"]=this.Name;
    return data;
  }
}