class PakagesData {
  int? id;
  String? packageName;
  int? price;
  String? description;

  PakagesData({this.id, this.packageName, this.price, this.description});

  PakagesData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    packageName = json['package_name'] ?? "";
    price = json['price'] ?? 0;
    description = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['package_name'] = packageName;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
