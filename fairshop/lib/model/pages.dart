class Pages {
  int? id;
  String? menu;

  Pages(
      {this.id, this.menu}
      );

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menu = json['menu'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu'] = this.menu;
    return data;
  }
}